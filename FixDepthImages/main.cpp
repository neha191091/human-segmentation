/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: neha
 *
 * Created on July 2, 2017, 3:15 PM
 */


//#include <stdio.h>
#include <iostream>
#include <opencv2/opencv.hpp>
#include <fstream>
#include <boost/filesystem.hpp>

//using namespace std;

/*
 * 
 */
namespace fs = ::boost::filesystem;

// return the filenames of all files that have the specified extension
// in the specified directory and all subdirectories
void get_all(std::string dataPath, const std::string& ext, std::vector<fs::path>& ret)
{
    const fs::path root = dataPath.c_str();

    if(!fs::exists(root) || !fs::is_directory(root)) 
    {
        std::cout<<root<<" not found!!"<<std::endl;
	return;
    }

    fs::recursive_directory_iterator it(root);
    fs::recursive_directory_iterator endit;

    while(it != endit)
    {
        if(fs::is_regular_file(*it) && it->path().extension() == ext) 
        {
            std::stringstream depthFile;
            depthFile << dataPath << it->path().filename().string();
            ret.push_back(depthFile.str());
        }
        ++it;

    }

}

bool isFileExist(char const* filename)
{
    std::ifstream file_tmp(filename);
    if (!file_tmp.is_open())
    {
        return false;
    }
    file_tmp.close();
    return true;
}

double convertexr2png(std::string dataPath, bool resizeImg = false)
{
    
    std::stringstream depthFilename;
   // depthFilename << dataPath << "human_" << pose << "_depth_" << angle <<"_0001.exr";
    
    depthFilename << dataPath;
    
    bool isExist = isFileExist(depthFilename.str().c_str());
    if (isExist == false){
        std::cout<<"The file "<<depthFilename.str()<<" does not exist\n";
        return false;
    }
    cv::Mat depthImage;
    depthImage = cv::imread(depthFilename.str(), -1);//cv::IMREAD_ANYDEPTH); 
    
    if(resizeImg)
    {
        cv::resize(depthImage, depthImage, depthImage.size() / 4, 0, 0, cv::INTER_NEAREST);
    }
    
    cv::Mat ch1, ch2, ch3;
    // "channels" is a vector of 3 Mat arrays:
    std::vector<cv::Mat> channels(3);
    // split img:
    cv::split(depthImage, channels);
    // get the channels (dont forget they follow BGR order in OpenCV)
    ch1 = channels[0];
    ch2 = channels[1];
    ch3 = channels[2];
    
    cv::Mat depthImage_short(depthImage.size(), CV_16U);
    for (int y = 0; y < depthImage.rows; y++)
    {
        for (int x = 0; x < depthImage.cols; x++)
        {
            const float d = depthImage.at<cv::Vec3f>(y, x)[0];
        
            if (d < 100.0f)
                depthImage_short.at<unsigned short>(y, x) = d * 1000;
            else 
                depthImage_short.at<unsigned short>(y, x) = 10000;     
            
            //TODO: change clipping val
            //nearThresh = 400;
            //farThresh  = 10000;
            
        }
    }
    
    
    
    std::string delimiter = ".";
    std::string newFilename = dataPath.substr(0, dataPath.find(delimiter));
    
    std::stringstream depthFilename1;
    depthFilename1 << newFilename <<".png";
    
    //std::stringstream depthFilename1;
    //depthFilename1 << dataPath << "human_" << pose << "_depth_" << angle <<".png";
    cv::imwrite(depthFilename1.str(), depthImage_short);
    
    depthImage = depthImage_short;
    
    
    //Check Range
    double minVal; 
    double maxVal; 
    cv::minMaxLoc( depthImage, &minVal, &maxVal);
    
    
    std::cout << "depthImage.dims = " << depthImage.dims << " depthImage.size = " << depthImage.size() << " depthImage.channels = " << depthImage.channels() << std::endl;
    
    std::cout << "min val depth: " << minVal << "\n";
    std::cout << "max val depth: " << maxVal << "\n";
    
    
    return minVal;
}

int main(int argc, char** argv) {
    std::cout<<"Start conversion\n";

    //std::string dataPath = "/home/neha/Documents/data/blender_data/render_data_scaled_down_mod/";
    std::string dataPath = "/home/neha/segmentation/data/blender_data/render_data_corrected_300/";

    bool resize = true; 
    //
    //bool convert = convertexr2png(depthFilename.str(),0,0);
    
    std::string ext = ".exr";
    std::vector<fs::path> paths;
    
    get_all(dataPath,ext,paths);
    std::cout<<"Number of exr paths: "<<paths.size()<<std::endl;
    
    ext = ".png";
    std::vector<fs::path> colorpaths;
    
    get_all(dataPath,ext,colorpaths);
    std::cout<<"Number of color paths: "<<colorpaths.size()<<std::endl;
    
    double min = 10000; //TODO: Change this to 5000 or a value in accordance with Keisuke's code
    for(int i=0; i < paths.size(); i++)
    {
        std::cout<<"Current path is : "<<paths[i]<<"\n";
        double minVal = convertexr2png(paths[i].c_str(), resize);
        if(min > minVal)
        {
            min = minVal;
        }
    }
    if(resize)
    {
        for(int i=0; i < colorpaths.size(); i++)
        {
            //std::cout<<"Current path is : "<<colorpaths[i]<<"\n";
            std::string colorpath = colorpaths[i].c_str();
            std::size_t found = colorpath.find("depth");
            cv::Mat colorImg;
            if (found!=std::string::npos)
            {
                colorImg = cv::imread(colorpaths[i].c_str(),-1); 
                double minVal; 
                double maxVal; 
                cv::minMaxLoc( colorImg, &minVal, &maxVal);

                if (i == 0)
                {std::cout << "depthImage.dims = " << colorImg.dims << " depthImage.size = " << colorImg.size().height << "," << colorImg.size().width << " depthImage.channels = " << colorImg.channels() << std::endl;

                std::cout << "min val depth: " << minVal << "\n";
                std::cout << "max val depth: " << maxVal << "\n";}
		
		cv::Size s = colorImg.size();
		
		if (s.height <= 120 && s.width <= 160)
		{
			std::cout<<"Already resized to correct dimensions";
			continue;
		}
                cv::resize(colorImg, colorImg, colorImg.size() / 4, 0, 0, cv::INTER_AREA);
                
                cv::Mat depthImage_short(colorImg.size(), CV_16U);
                for (int y = 0; y < colorImg.rows; y++)
                {
                    for (int x = 0; x < colorImg.cols; x++)
                    {
                        const float d = colorImg.at<unsigned short>(y, x);
                        if(i == 0)
                        {std::cout<<d<<" ";}
                        if (d > 10000){
                            
                            //std::cout<<"Init depth: "<<colorImg.at<float>(y, x)<<std::endl;
                            colorImg.at<unsigned short>(y, x) = 10000; 
                            //std::cout<<"Changed depth: "<<colorImg.at<float>(y, x)<<std::endl;
                        }
                        else
                        {
                            colorImg.at<unsigned short>(y, x) = d;
                        }

                        //TODO: change clipping val
                        //nearThresh = 400;
                        //farThresh  = 10000;

                    }
                }
                //colorImg = depthImage_short;
                minVal = 0;
                maxVal = 0;
                cv::minMaxLoc( colorImg, &minVal, &maxVal);
                if(i == 0)
                {std::cout << "resized depthImage.dims = " << colorImg.dims << " depthImage.size = " << colorImg.size() << " depthImage.channels = " << colorImg.channels() << std::endl;

                std::cout << "resized min val depth: " << minVal << "\n";
                std::cout << "resized max val depth: " << maxVal << "\n";}
                if(i == 0)
                    std::cout << colorImg;
                
            }
            else
            {
              	colorImg = cv::imread(colorpaths[i].c_str(), cv::IMREAD_COLOR);
		cv::Size s = colorImg.size();
		
		if (s.height <= 120 && s.width <= 160)
		{
			std::cout<<"Already resized to correct dimensions";
			continue;
		}
              	cv::resize(colorImg, colorImg, colorImg.size() / 4, 0, 0, cv::INTER_NEAREST);
            }
            cv::imwrite(colorpaths[i].c_str(), colorImg);
        }
    }
    
    std::cout<<"min is : "<<min<<"\n";
    for(int i=0; i < paths.size(); i++)
    {
        if( remove( paths[i].c_str() ) != 0 )
            perror( "Error deleting file" );
        else
            puts( "File successfully deleted" );
    }
    
    return 0;
}

