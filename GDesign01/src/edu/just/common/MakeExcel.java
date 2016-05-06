/*
 * 文件： MakeExcel.java
 * 创建日期 2016年5月5日
 *
 */
package edu.just.common;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
 
 /**
 * 
 * @Description: TODO(这里用一句话描述这个类的作用)
 * @date： (2016年5月5日 下午8:13:10)
 * @author: mas
 * 
 * Modified history
 * 
 * 	Modified date: 	
 * 	Modifier user: 		
 * 	description:报表工具类	
 * 
 * */
public class MakeExcel {
	private HSSFWorkbook wb = null;
	private HSSFSheet sheet = null;
	
	
	public MakeExcel(HSSFWorkbook wb, HSSFSheet sheet){
		this.wb = wb;
		this.sheet = sheet;
	}
	
	/**
	 * 创建通用EXCEL头部
	 * @param headString	头部显示的字符
	 * @param colSum	该列表的列数
	 */
	public void createCommonHead(String headString, int colSum){
		//设置第一行
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = row.createCell(0);
		//row.setHeight((short) 1000);
		
		//指定单元格为字符串类型
		cell.setCellType(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue(new HSSFRichTextString(headString));
		
		//指定合并区域
//		sheet.addMergedRegion(new Region(0, (short) 0, 0, (short) colSum));
		
		//定义单元格格式，添加单元格表样式，并添加到工作薄
		HSSFCellStyle cellStyle = wb.createCellStyle();
		
		//设置单元格水平对齐类型
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//指定单元格垂居中对齐
		cellStyle.setWrapText(true);//指定单元格自动换行
		
		//设置单元格字体
		HSSFFont font = wb.createFont();
		font.setFontName("宋体");
		cell.setCellStyle(cellStyle);
		
	}
	
	/**
	 * 创建通用EXCEL第二行
	 * @param params	统计条件数组
	 * 
	 * @param colSum
	 */
	@SuppressWarnings("deprecation")
	public void createCommonTwoRow(String[] params, int colSum){
		//创建第二行
		HSSFRow row1 = sheet.createRow(1);
		
		row1.setHeight((short) 400);
		
		HSSFCell cell2 = row1.createCell(0);
		
		cell2.setCellType(HSSFCell.ENCODING_UTF_16);
		cell2.setCellValue(new HSSFRichTextString("时间：" + params[0] + "至" + params[1]));
		
		//指定合并区域
//		sheet.addMergedRegion(new Region(1,(short)0, 1, (short)colSum));
		
		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		cellStyle.setWrapText(true);//指定单元格自动换行
		
		//设置单元格字体
		HSSFFont font = wb.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName("宋体");
		font.setFontHeight((short) 250);
		cellStyle.setFont(font);
		
		cell2.setCellStyle(cellStyle);
	}
	
	/**
	 * 设置报表标题
	 * @param columHeader	标题字符串数组
	 */
	public void createColumHeader(String[]columHeader){
		//设置列头  在第三行
		HSSFRow row2 = sheet.createRow(2);
		
		//指定行高
		row2.setHeight((short) 600);
		
		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//指定单元格垂直居中对齐
		cellStyle.setWrapText(true);//指定单元格自动换行
		
		//单元格字体
		HSSFFont font = wb.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName("宋体");
		font.setFontHeight((short)200);
		cellStyle.setFont(font);
		
		//设置单元格背景色
		cellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		
		HSSFCell cell3 = null;
		
		for(int i=0; i<columHeader.length; i++){
			cell3 = row2.createCell(i);
			cell3.setCellType(HSSFCell.ENCODING_UTF_16);
			cell3.setCellStyle(cellStyle);
			cell3.setCellValue(new HSSFRichTextString(columHeader[i]));
		}
	}
	
	/**
	 *	创建内容单元格
	 * @param row
	 * @param col	short型的列索引
	 * @param align  对齐方式
	 * @param val	列值
	 */
	public void createCell(HSSFWorkbook wb, HSSFRow row, int col, short align, String val){
		
		HSSFCell cell = row.createCell(col);
		cell.setCellType(HSSFCell.ENCODING_UTF_16);
		cell.setCellValue(new HSSFRichTextString(val));
		HSSFCellStyle cellstyle = wb.createCellStyle();
		cellstyle.setAlignment(align);
		cell.setCellStyle(cellstyle);
	}
	
	/**
	 * 创建合计行
	 * @param colSum	需要合并到的列索引
	 * @param cellValue	
	 */
	public void createLastSumRow(int colSum, String[] cellValue){
		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);//指定单元格居中对齐
		cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//指定单元格垂直居中对齐
		cellStyle.setWrapText(true);//指定单元格自动换行
		
		//单元格字体
		HSSFFont font = wb.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName("宋体");
		font.setFontHeight((short) 250);
		cellStyle.setFont(font);
		
		//获取工作表最后一行
		HSSFRow lastRow = sheet.createRow((short) (sheet.getLastRowNum() +1));
		HSSFCell sumCell = lastRow.createCell(0);
		
		sumCell.setCellValue(new HSSFRichTextString("合计"));
		sumCell.setCellStyle(cellStyle);
		
		//合并  最后一行的第零列-- 最后一行的第一列
		
		//指定合并区域
		
		for(int i=2; i< (cellValue.length +2); i++){
			//定义最后一行的第三行
			sumCell = lastRow.createCell(i);
			sumCell.setCellStyle(cellStyle);
			
			//定义数组， 从0开始
			sumCell.setCellValue(new HSSFRichTextString(cellValue[i -2]));
			
		}
	}
	
	/**
	 * 输入EXCEL文件
	 * @param fileName 文件名
	 */
	public void outputExcel(String fileName){
		FileOutputStream fos = null;
		try{
			fos = new FileOutputStream(new File(fileName));
			wb.write(fos);
			fos.close();
		}catch(FileNotFoundException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
	}

	public HSSFWorkbook getWb() {
		return wb;
	}

	public void setWb(HSSFWorkbook wb) {
		this.wb = wb;
	}

	public HSSFSheet getSheet() {
		return sheet;
	}

	public void setSheet(HSSFSheet sheet) {
		this.sheet = sheet;
	}
	
	
}

