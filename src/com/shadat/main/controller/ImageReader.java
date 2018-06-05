package com.shadat.main.controller;

import java.io.File;

public class ImageReader {
    public static void main(String[] args)
    {
        String path = System.getProperty("user.dir")+"/web/img/veneer-sheets/";
        File folder = new File(path);
        File[] listOfFiles = folder.listFiles();
        System.out.println(path);
        for (File file : listOfFiles) {
            if (file.isFile()) {
             String fileName = file.getName().replace(" ","%20");
                System.out.println(fileName);
            }
        }
    }
}
