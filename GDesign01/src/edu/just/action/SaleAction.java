/*
 * 文件： SaleAction.java
 * 创建日期 2016年5月5日
 *
 */
package edu.just.action;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import edu.just.common.MakeExcel;
import edu.just.entity.Sale;
import edu.just.service.SaleService;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年5月5日 下午3:44:25)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:	
 * 
 * */
@Controller
@Scope("prototype")
public class SaleAction extends ActionSupport implements ModelDriven<Sale>{
	
	@Resource
	private SaleService saleService;
	
	private Sale model = new Sale();
	
	private InputStream excelStream;
	String fileName = "公司盈利表.xls";
	
	String filePath = File.separator + "excelTempet" + File.separator;
	
	@Override
	public Sale getModel() {
		// TODO Auto-generated method stub
		return model;
	}

	public String addUI() throws Exception{
		
		return "addUI";
	}
	public String add() throws Exception{
		
		return "toList";
	}
	/*销售报告*/
	public String list() throws Exception{
		//从数据库中查出
		List<Sale> saleList = saleService.findAll();
		ActionContext.getContext().put("saleList", saleList);
		return "list";
	}
	
	// 文件下载
	public InputStream getExcelStream() throws FileNotFoundException,
			UnsupportedEncodingException {
		return excelStream;
	}
	
	/*销售文件导出成excel*/
	public String show() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		
		List<Sale> saleList = saleService.findAll();
		
		
		HttpServletResponse response = ServletActionContext.getResponse();
		
		String fileName = "导出Excel.xls";
		fileName = new String(fileName.getBytes("GBK"), "iso8859-1");
		response.reset();
		response.setHeader("Content-Disposition", "attachment;filename="  
                + fileName);// 指定下载的文件名 
		
		response.setContentType("application/vnd.ms-excel");  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        OutputStream output = response.getOutputStream();  
        BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);
        
        //定义单元格报头
        String worksheetTitle = "导出信息";
        
        HSSFWorkbook wb = new HSSFWorkbook();
        
        //创建单元格样式
        HSSFCellStyle cellStyleTitle = wb.createCellStyle();
        //指定单元格居中对齐
        cellStyleTitle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //指定单元格垂直居中对齐
        cellStyleTitle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  
        // 指定当单元格内容显示不下时自动换行  
        cellStyleTitle.setWrapText(true);  
     // ------------------------------------------------------------------  
        HSSFCellStyle cellStyle = wb.createCellStyle();  
        // 指定单元格居中对齐  
        cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);  
        // 指定单元格垂直居中对齐  
        cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);  
        // 指定当单元格内容显示不下时自动换行  
        cellStyle.setWrapText(true);  
        // ------------------------------------------------------------------  
        // 设置单元格字体  
        HSSFFont font = wb.createFont();  
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);  
        font.setFontName("宋体");  
        font.setFontHeight((short) 200);  
        cellStyleTitle.setFont(font);  
        
        //表名
        String id = "id";
        String name = "name";
        String profit = "profit";
        String month = "month";
        
        HSSFSheet sheet = wb.createSheet();
        MakeExcel exportExcel = new MakeExcel(wb, sheet);
        
        //创建报表头部
        exportExcel.createCommonHead(worksheetTitle, 4);
        
        // 定义第一行  
        HSSFRow row1 = sheet.createRow(1);  
        HSSFCell cell1 = row1.createCell(0);
        
      //第一行第一列  
        
        cell1.setCellStyle(cellStyleTitle);  
        cell1.setCellValue(new HSSFRichTextString(id));
      //第一行第二列  
        cell1 = row1.createCell(1);  
        cell1.setCellStyle(cellStyleTitle);  
        cell1.setCellValue(new HSSFRichTextString(name));  
  
        //第一行第三列  
        cell1 = row1.createCell(2);  
        cell1.setCellStyle(cellStyleTitle);  
        cell1.setCellValue(new HSSFRichTextString(profit));  
  
        //第一行第四列  
        cell1 = row1.createCell(3);  
        cell1.setCellStyle(cellStyleTitle);  
        cell1.setCellValue(new HSSFRichTextString(month));
        
        //定义第二行
        HSSFRow row = sheet.createRow(2);  
        HSSFCell cell = row.createCell(1);
        Sale sale = new Sale();
        for(int i=0; i<saleList.size(); i++){
        	sale = saleList.get(i);
        	row = sheet.createRow(i + 2);
        	 cell = row.createCell(0);  
             cell.setCellStyle(cellStyle);
             cell.setCellValue(new HSSFRichTextString(sale.getId() + ""));
             
             cell = row.createCell(1);  
             cell.setCellStyle(cellStyle);  
             cell.setCellValue(new HSSFRichTextString(sale.getName()));  
               
             cell = row.createCell(2);  
             cell.setCellStyle(cellStyle);  
             cell.setCellValue(new HSSFRichTextString(sale.getProfit() + ""));  
               
             cell = row.createCell(3);  
             cell.setCellStyle(cellStyle);  
             cell.setCellValue(new HSSFRichTextString(sale.getMonth() + ""));
             
             
        }
        
        try{
        	bufferedOutPut.flush();
        	wb.write(bufferedOutPut);
        	bufferedOutPut.close();
        }catch(IOException e){
        	e.printStackTrace();
        	System.out.println("Output is closed");
        }finally{
        	saleList.clear();
        }
		return null;
	}
	

	public String getFileName() {
		try {
			fileName = new String(fileName.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}

