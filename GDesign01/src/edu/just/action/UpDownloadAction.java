/*
 * 文件： UpDownloadAction.java
 * 创建日期 2016年4月26日
 *
 */
package edu.just.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import edu.just.util.FileUtil;

/**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年4月26日 下午5:19:23)
 * @author: mas
 * 
 *          Modified history
 * 
 *          Modified date: Modifier user: description:
 * 
 * */
@Controller
@Scope("prototype")
public class UpDownloadAction extends ActionSupport {

	private List<File> file;// 封装该文件域对应的文件的内容
	private List<String> fileFileName;// 封装该文件域对应的文件的文件类型
	private List<String> fileContentType;// 封装了该文件域对应的文件类型
	private String fileName;// 获得jsp中pram参数

	private String savePath;
	
	Date fileCreatedDate;
	//对文档经行归类
	private String uploadDir = "CKZL";//默认

	// 文件上传
	public String uploadFile() throws Exception {
		fileCreatedDate = new Date();
		
		System.out.println(getSavePath());
		InputStream inputStream;
		OutputStream os;
		File destFile;
		for (int i = 0; i < file.size(); i++) {
			inputStream = new FileInputStream(file.get(i));
			destFile = new File(getSavePath(), this.getFileFileName().get(i));
			
			os = new FileOutputStream(destFile);
			byte[] buffer = new byte[400];
			int length = 0;
			while ((length = inputStream.read(buffer)) > 0) {
				os.write(buffer, 0, length);
			}
			inputStream.close();
			os.close();
		}
		/*HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("fileName", fileFileName);*/
		
		//存储要下载的文件名
		Map<String, String> fileNameMap = new HashMap<String, String>();
		FileUtil.listFile(new File(getSavePath()), fileNameMap);
		
		//将提供者（当前上传文件的用户）、当前时间、文件路径等信息放入栈中
//		ActionContext.getContext().getValueStack().push(arg0);
		
		//将要下载的文件名放入堆栈中
		ActionContext.getContext().put("fileNameMap", fileNameMap);
		
		return "upload";
	}

	// 文件下载
	public InputStream getDownloadFile() throws FileNotFoundException,
			UnsupportedEncodingException {
		System.out.println("@2222222222222222222"+ getSavePath() + "\\" + this.getFileName());
		
		
		// 如果下载文件名为中文，进行字符编码转换
		ServletActionContext.getResponse().setHeader(
				"Context-Disposition",
				"attachment;fileName="
						+ java.net.URLEncoder.encode(fileName, "UTF-8"));

		InputStream inputStream = new FileInputStream(getSavePath() + "\\" + fileName);
		System.out.println(inputStream);
		return inputStream;
//		System.out.println(inputStream);
//		return inputStream;
	}

	public String downloadFile() throws Exception {
		
		//获得文件下载目录
		return "download";
	}

	/*上传文档*/
	public String addFile() throws Exception {
		return "addUI";
	}
	/*列出文件*/
	public String list01File() throws Exception {
		setUploadDir("CKZL");
		
		//存储要下载的文件名
		Map<String, String> fileNameMap = new HashMap<String, String>();
		FileUtil.listFile(new File(getSavePath()), fileNameMap);
						
		//将要下载的文件名放入堆栈中
		ActionContext.getContext().put("fileNameMap", fileNameMap);
		ActionContext.getContext().put("uploadDir", this.getUploadDir());
		System.out.println(getSavePath());
		return "list";
	}
	
	/*列出文件*/
	public String list02File() throws Exception {
		//存储要下载的文件名
		setUploadDir("GZZD");
		Map<String, String> fileNameMap = new HashMap<String, String>();
		FileUtil.listFile(new File(getSavePath()), fileNameMap);
						
		//将要下载的文件名放入堆栈中
		ActionContext.getContext().put("fileNameMap", fileNameMap);
		ActionContext.getContext().put("uploadDir", this.getUploadDir());
		System.out.println(getSavePath());
		return "list";
	}
	
	/*列出文件*/
	public String list03File() throws Exception {
		//存储要下载的文件名
		setUploadDir("PXZL");
		System.out.println(getSavePath());
		Map<String, String> fileNameMap = new HashMap<String, String>();
		FileUtil.listFile(new File(getSavePath()), fileNameMap);
						
		//将要下载的文件名放入堆栈中
		ActionContext.getContext().put("fileNameMap", fileNameMap);
		return "list";
	}
	public String getFileName() throws UnsupportedEncodingException {
		return fileName;
	}

	public void setFileName(String fileName)
			throws UnsupportedEncodingException {
		this.fileName = new String(fileName.getBytes("ISO8859-1"), "utf-8");
	}

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getSavePath() throws UnsupportedEncodingException {
		return ServletActionContext.getServletContext().getRealPath(
				"/WEB-INF/" + savePath + "/" + uploadDir);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}


	public String getUploadDir() {
		return uploadDir;
	}

	public void setUploadDir(String uploadDir) {
		this.uploadDir = uploadDir;
	}
}
