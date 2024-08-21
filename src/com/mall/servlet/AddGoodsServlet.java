package com.mall.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.mall.model.Model;
import com.mall.po.Goods;

public class AddGoodsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		FileItemFactory fileItemFactory = new DiskFileItemFactory();
		ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
		servletFileUpload.setHeaderEncoding("GBK");
		Goods Goods = new Goods();
		if (servletFileUpload.isMultipartContent(request)) {// 判断请求类型

			List<FileItem> fileItemList=null;
			try {
				fileItemList = servletFileUpload.parseRequest(request);
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			for (FileItem fileItem : fileItemList) {
				// 组件类型
				if (!fileItem.isFormField()) {// 文件上传的组件

					// 1.获取文件名称
					String fileName = fileItem.getName();

					// 2.上传服务器(获取服务器的更路径)
					String realPath = request.getRealPath("/images");

					FileOutputStream fos = new FileOutputStream(new File(realPath, fileName));
					IOUtils.copy(fileItem.getInputStream(), fos);

					// 3.释放资源
					fileItem.delete();// 删除服务端的缓存文件
					fos.close();
					
					Goods.setPicture("images/" + fileName);
					
				} else {
					String fieldName= fileItem.getFieldName(); //获取表单控件字段名称
					String value= new  String(fileItem.getString("GBK")); //获取表单控制的值
					if(fieldName.equals("superTypeId")){
						Goods.setSuperTypeId(Integer.parseInt(value));
					}
					if(fieldName.equals("subTypeId")){
						Goods.setSubTypeId(Integer.parseInt(value));
					}
					
					
					if(fieldName.equals("GoodsName")){
						Goods.setGoodsName(value);
					}
					
					if(fieldName.equals("ISBN")){
						Goods.setISBN(value);
					}
					
					if(fieldName.equals("introduce")){
						Goods.setIntroduce(value);
					}
					
					if(fieldName.equals("pages")){
						Goods.setProduceDate(value);
					}
					if(fieldName.equals("publisher")){
						Goods.setPublisher(value);
					}
					if(fieldName.equals("author")){
						Goods.setAuthor(value);
					}
					
					if(fieldName.equals("price")){
						Goods.setPrice(Float.parseFloat(value));
					}
					
					if(fieldName.equals("nowPrice")){
						Goods.setNowPrice(Float.parseFloat(value));
					}
					
					if(fieldName.equals("GoodsNum")){
						Goods.setGoodsNum(Integer.parseInt(value));
					}
					if(fieldName.equals("newGoods")){
						Goods.setNewGoods(Integer.parseInt(value));
					}
					if(fieldName.equals("saleGoods")){
						Goods.setSaleGoods(Integer.parseInt(value));
					}
					
					if(fieldName.equals("hotGoods")){
						Goods.setHostGoods(Integer.parseInt(value));
					}
					if(fieldName.equals("specialGoods")){
						Goods.setSpecialGoods(Integer.parseInt(value));
					}
					
				
				
					
		
					
				}
			}
		}
		
		Model model = new Model();
		if(model.addGoods(Goods)) {
			request.setAttribute("message", "添加成功");
		} else {
			request.setAttribute("message", "添加失败");
		}
			
		request.getRequestDispatcher("Admin/pages/addGoods.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
