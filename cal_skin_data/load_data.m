%% read data
function [Image, Ground_Truth]=load_data()
file_path = 'Pratheepan_Dataset\FamilyPhoto\';% 图像文件夹路径 ?
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有bmp格式的图像 ?
img_num = length(img_path_list);%获取图像总数量?
Image=cell(1,img_num);
if img_num > 0 %有满足条件的图像 ?
            for j = 1:img_num %逐一读取图像 ?
                image_name = img_path_list(j).name;% 图像名 ?
                image = imread(strcat(file_path,image_name)); 
                Image{j}=image;
%                fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% 显示正在处理的图像名 ?


%这里直接可以访问细胞元数据的方式访问数据

            end 
end 
%% read groundTruth
file_path = 'Ground_Truth\GroundT_FamilyPhoto\';% 图像文件夹路径 ?
img_path_list = dir(strcat(file_path,'*.png'));%获取该文件夹中所有bmp格式的图像 ?
img_num = length(img_path_list);%获取图像总数量?
GroundTruth=cell(1,img_num);
if img_num > 0 %有满足条件的图像 ?
            for j = 1:img_num %逐一读取图像 ?
                image_name = img_path_list(j).name;% 图像名 ?
                image = imread(strcat(file_path,image_name)); 
                Ground_Truth{j}=image;
%                fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% 显示正在处理的图像名 ?


%这里直接可以访问细胞元数据的方式访问数据

            end 
end
end