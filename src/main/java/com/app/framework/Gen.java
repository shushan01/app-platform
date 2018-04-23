package com.app.framework;

/**
 * Created by Administrator on 2018/4/21 0021.
 */

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class Gen {

    public static void main(String[] args) {
        Gen obj = new Gen();
        // 此处为我创建Excel路径：E:/zhanhj/studysrc/jxl下
        File file = new File("table.xls");
        List excelList = obj.readExcel(file);
        String tableName = "";
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < excelList.size(); i++) {
//            StringBuffer sb1 = new StringBuffer();
            List list = (List) excelList.get(i);
            if (list.size() == 0 && i < excelList.size() - 2) {
                List tableList = (List) excelList.get(i + 1);
                tableName = tableList.get(2).toString();
                if (i != 0)
                    sb.append("PRIMARY KEY (`id`))ENGINE=InnoDB DEFAULT CHARSET=utf8;");
                sb.append("drop table  if exists " + tableName + "; create table " + tableName + " (\n ");
                i = i + 2;
                continue;
            }
            List fieldList = (List) excelList.get(i);
            String fieldName = fieldList.get(0).toString();
            String dataType = fieldList.get(1).toString();
            try {
                String comment = fieldList.get(2).toString();
                if ("id".equals(fieldName)) {
                    sb.append(fieldName + " " + dataType + " NOT NULL AUTO_INCREMENT comment '" + comment + "',\n");
                } else
                    sb.append(fieldName + " " + dataType + " comment '" + comment + "',\n");
            } catch (Exception e) {
                System.out.println(i);
            }
        }
        File file2 = new File("table.sql");
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter(file2, true));
            writer.write(sb.toString());
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 去读Excel的方法readExcel，该方法的入口参数为一个File对象
    public List readExcel(File file) {
        try {
            // 创建输入流，读取Excel
            InputStream is = new FileInputStream(file.getAbsolutePath());
            // jxl提供的Workbook类
            Workbook wb = Workbook.getWorkbook(is);
            // Excel的页签数量
            int sheet_size = wb.getNumberOfSheets();
            for (int index = 0; index < sheet_size; index++) {
                List<List> outerList = new ArrayList<List>();
                // 每个页签创建一个Sheet对象
                Sheet sheet = wb.getSheet(index);
                // sheet.getRows()返回该页的总行数
                for (int i = 0; i < sheet.getRows(); i++) {
                    List innerList = new ArrayList();
                    // sheet.getColumns()返回该页的总列数
                    for (int j = 0; j < sheet.getColumns(); j++) {
                        String cellinfo = sheet.getCell(j, i).getContents();
                        if (cellinfo.isEmpty()) {
                            continue;
                        }
                        innerList.add(cellinfo);
                    }
                    outerList.add(i, innerList);
                    System.out.println();
                }
                return outerList;
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (BiffException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
