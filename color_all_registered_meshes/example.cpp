/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.cpp
 * Author: neha
 *
 * Created on July 13, 2017, 10:16 AM
 */

#include <cstdlib>
#include <fstream>
#include <iostream>
#include <vector>
#include <map>
#include <opencv2/opencv.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <boost/filesystem.hpp>
#include <cstring>

using namespace std;

/*
 * 
 */

//const std::map<std::string, std::vector<float>> segColors = {
//        {"torso", {0.0, 255.0, 0.0}},
//        {"head", {0.0, 0.0, 255.0}}
//};

/*
std::map<int, std::vector<uchar>> segColors = {
        {0, {0, 255, 0}},	//torso
        {1, {0, 0, 255}},	//head
        {2, {255, 0, 0}},	//upper_left_arm
        {3, {100, 0, 0}},	//upper_right_arm
        {4, {255, 0, 255}},	//lower_left_arm
        {5, {100, 0, 100}},	//lower_right_arm
        {6, {255, 255, 0}},	//upper_left_leg
        {7, {100, 100, 0}},	//upper_right_leg
        {8, {0, 255, 255}},	//lower_left_leg
        {9, {0, 100, 100}}	//lower_right_leg
};
*/

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

namespace fs = ::boost::filesystem;

// return the filenames of all files that have the specified extension
// in the specified directory and all subdirectories
void get_all(std::string dataPath, const std::string& ext, std::vector<fs::path>& ret)
{
    const fs::path root = dataPath.c_str();
    if(!fs::exists(root) || !fs::is_directory(root)) return;

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

std::vector<int> myIntParser(std::string line, char delimiter1 = ' ', char delimiter2 = '\t')
{
	//Use this instead of myFloatParserOld
	std::vector<int> row;
	std::istringstream iss(line);
	std::string word;
	while (std::getline(iss, word, delimiter1))
	{
		std::istringstream iss_in(word);
		std::string word_in;
		while (std::getline(iss_in, word_in, delimiter2))
		{	
			int entry = atoi(word_in.c_str());
			row.push_back(entry);
		}
	}

	//int entry = atoi(word.c_str());
	//row.push_back(entry);
	return row;
}

std::vector<float> myFloatParser(std::string line, char delimiter1 = ' ', char delimiter2 = '\t')
{
	//Use this instead of myFloatParserOld
	std::vector<float> row;
	std::istringstream iss(line);
	std::string word;
	while (std::getline(iss, word, delimiter1))
	{
		std::istringstream iss_in(word);
		std::string word_in;
		while (std::getline(iss_in, word_in, delimiter2))
		{	
			float entry = atof(word_in.c_str());
			row.push_back(entry);
		}
		//float entry = atof(word_in.c_str());
		//row.push_back(entry);
	}

	float entry = atof(word.c_str());
	row.push_back(entry);
	return row;
}

std::vector<std::string> myWordParser(std::string line, char delimiter1 = ' ', char delimiter2 = '\t')
{
	//Use this instead of myFloatParserOld
	std::vector<std::string> row;
	std::istringstream iss(line);
	std::string word;
	while (std::getline(iss, word, delimiter1))
	{
		std::istringstream iss_in(word);
		std::string word_in;
		while (std::getline(iss_in, word_in, delimiter2))
		{	
			if(word.compare("") != 0)
				row.push_back(word_in);
		}
		//float entry = atof(word_in.c_str());
		//row.push_back(entry);
	}
	if(word.compare("") != 0)
		row.push_back(word);
	return row;
}

std::vector<float> myFloatParserOld(std::string line, char delimiter)
{
	// DEPRECATED: DONOT USE
	int pos = 0;
	char nextChar = line[0];
	float entry = 0;
	float shift = 10;
	float sign = 1;
	float multiplier = 1;
	std::vector<float> row;
	while(nextChar != '\0')
	{
		if(nextChar == delimiter)
		{
			row.push_back(entry);
			entry = 0;
			shift = 10;
			sign = 1;
			multiplier = 1;
		}
		else if(nextChar == '-')
		{
			sign = -1;
		}
		else if(nextChar == '.')
		{
			multiplier = 0.1;
			shift = 1;
		}
		else if(nextChar == 'e' && line[pos+1] == '-')
		{
		entry = 0;
		nextChar = line[++pos];
		while((nextChar != '\0') && (nextChar != delimiter))
		{
			nextChar = line[++pos];
		}
		continue;
		}
		else
		{
			entry = entry*shift + (float(nextChar)-48)*sign*multiplier;
			if(multiplier != 1)
			{
				multiplier = multiplier/10;
			}                
		}
		nextChar = line[++pos];
	}
	row.push_back(entry);
	return row;
}


int main(int argc, char** argv) 
{
    const std::string data_path = "/media/neha/ubuntu/data/bodymodels/SPRING_MALE/";

    
	
	// GET COLORS

	const std::string input_mesh = "mesh001_colored.ply";
    std::stringstream ip_basemesh_path;
    ip_basemesh_path << data_path << input_mesh;
    

    std::ifstream basefile(ip_basemesh_path.str().c_str());
    if(!basefile)
    {
        std::cout<<"File "<<ip_basemesh_path.str().c_str()<<" not found!!!\n"<<endl;
        return -1;
    }
    std::string line;
    std::vector<std::string> headers;
    int num_vertices = 0;
    std::string num_vert_label ="element vertex";
    int num_faces = 0;
    std::string num_face_label ="element face";
    std::string end_header ="end_header";
    do
    {
		std::getline(basefile, line);
			std::cout<<line<<std::endl;
		if (line.find(num_vert_label) != std::string::npos) 
		{
			num_vertices = atoi(line.substr(num_vert_label.length()).c_str());
		}
		if (line.find(num_face_label) != std::string::npos) 
		{
			num_faces = atoi(line.substr(num_face_label.length()).c_str());
		}
		headers.push_back(line);
    }
    while(line.find(end_header) == std::string::npos);
    std::cout<<"num vertices: "<<num_vertices<<std::endl;
    std::cout<<"num faces: "<<num_faces<<std::endl;
    int count_vert=0;
    std::vector<std::vector<float> > colorbasematrix;
    char delimiter = ' ';
    while (std::getline(basefile, line) && count_vert < num_vertices)
    {
        std::vector<float> row = myFloatParser(line, delimiter);
		//std::cout<<"Row size : "<<row.size()<<std::endl;
		//for(int j=0;j<row.size();j++)
		//	std::cout<<row[j]<<std::endl;
        colorbasematrix.push_back(row);
		count_vert++;
    }


    std::cout<<"Got the color matrix: size "<<colorbasematrix.size()<<std::endl;



	// READ OBJ
	
	std::string ext = ".obj";
    std::vector<fs::path> paths;
    
    get_all(data_path,ext,paths);

    for(int i=0; i < paths.size(); i++)
	{
		std::string path = paths[i].c_str();	
		std::stringstream ip_path;
		ip_path << path;

		std::ifstream infile(ip_path.str().c_str());
		if(!infile)
		{
			std::cout<<"File "<<ip_path.str().c_str()<<" not found!!!\n"<<endl;
			return -1;
		}	
		else
		{
			std::cout<<"Read File "<<ip_path.str().c_str()<<endl;
		}

		int vert_it=0;
		std::vector<std::vector<float> > vertexMatrix;
		int face_it=0;
		std::vector<std::vector<float> > faceMatrix;
		while(std::getline(infile, line))
		{
			//std::cout<<line<<std::endl;
			std::vector<float> row;
			std::vector<std::string> words = myWordParser(line, delimiter);
			std::string first_word = words[0];
			if (first_word.compare("v") == 0)
			{
				for (int j=1; j<words.size(); j++)
				{
					float entry = atof(words[j].c_str());
					row.push_back(entry);
				}
				vertexMatrix.push_back(row);
				vert_it++;
			}
			else if (first_word.compare("f") == 0)
			{
				for (int j=1; j<words.size(); j++)
				{
					std::vector<std::string> faceVertexWord = myWordParser(words[j], '/');
					float entry = atof(faceVertexWord[1].c_str());
					row.push_back(entry);
				}
				faceMatrix.push_back(row);
				face_it++;
			}
		}

		if(num_vertices != vert_it || num_faces != face_it)
		{
			std::cout<<"MISMATCH in number of faces or vertices for file: "<<path.c_str()<<std::endl;
			std::cout<<"Vertices and faces in color file: "<<num_vertices<<" , "<<num_faces<<std::endl;
			std::cout<<"Vertices and faces in obj file: "<<vert_it<<" , "<<face_it<<std::endl;
			continue;
		}
		else
		{
			std::cout<<"Number of faces and vertices MATCH for file: "<<path.c_str()<<std::endl;
		}



		//PLY OUTPUT

		std::string period = ".";
		std::cout<<"Found path is "<<path<<std::endl;
		std::string filename_no_ext = path.substr(0,path.find(period));
		std::stringstream op_new_path;
		op_new_path << filename_no_ext <<".ply";


		std::cout<<"New output path: "<<op_new_path.str().c_str()<<std::endl;
		
		std::ofstream outfile(op_new_path.str().c_str());
		if(!outfile)
		{
			std::cout<<"File "<<op_new_path.str().c_str()<<" not found and not created!!!\n"<<endl;
			return -1;
		}
		else
		{
			std::cout<<"Output file created : "<<op_new_path.str().c_str()<<std::endl;
		}

		//Output headers in the ply
		int it=0;
		while(it<headers.size())
		{
			outfile << headers[it] <<std::endl;
			it++;
		}

		for(int v_i=0; v_i<num_vertices; v_i++)
		{
			for(int j=0; j<3; j++)
			{
				outfile << vertexMatrix[v_i][j] << delimiter;
			}
			// Add color too
			for(int j=3; j<colorbasematrix[v_i].size()-1; j++)
			{
				outfile << colorbasematrix[v_i][j] << delimiter;
			}
			outfile<<endl;			
		}

		for(int f_i=0; f_i<num_faces; f_i++)
		{
			outfile << faceMatrix[f_i].size()-1 << delimiter;
			for(int j=0; j<faceMatrix[f_i].size()-1 ; j++)
			{
				//OBJ indices for vertices start at 1, but PLY indices start at 0
				outfile << faceMatrix[f_i][j] - 1 << delimiter;
			}
			outfile<<endl;			
		}
		std::cout<<"Processed "<<i<<std::endl;
    }	
    
    return 0;
}
