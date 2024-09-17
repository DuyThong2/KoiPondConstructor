/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.SWPKoiContructor.utils;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Utility {
    public static LocalDateTime calendarToLocalDateTime(Calendar calendar) {
        if (calendar == null) {
            return null;
        }
        Date date = calendar.getTime();
        return LocalDateTime.ofInstant(date.toInstant(), ZoneId.systemDefault());
    }
    
    public static Calendar localDateTimeToCalendar(LocalDateTime localDateTime) {
        if (localDateTime == null) {
            return null;
        }
        Calendar calendar = Calendar.getInstance();
        Date date = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
        calendar.setTime(date);
        return calendar;
    }
    
    public static LocalDate utilDateToLocalDate(Date utilDate) {
        if (utilDate == null) {
            return null;
        }
        // Convert java.util.Date to LocalDate using the system default time zone
        return utilDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
    }

    // Method to convert LocalDate to java.util.Date
    public static Date localDateToUtilDate(LocalDate localDate) {
        if (localDate == null) {
            return null;
        }
        // Convert LocalDate to java.util.Date using the system default time zone
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }
    
     public static int parseInt(String input, int minValue, int maxValue) {
        try {
            // Parse the input as an int
            int parsedValue = Integer.parseInt(input);

            // Apply constraints
            if (parsedValue < minValue) {
                return minValue;
            } else if (parsedValue > maxValue) {
                return maxValue;
            }

            return parsedValue; // Return the parsed int value within range
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Input must be a valid integer.");
        }
    }
     
     public static double parseDoubleAndConstrain(String input, double minValue, double maxValue) {
        try {
            // Parse the input as a double
            double parsedValue = Double.parseDouble(input);

            // Apply constraints
            if (parsedValue < minValue) {
                return minValue;
            } else if (parsedValue > maxValue) {
                return maxValue;
            }
            
            return parsedValue; // Return the parsed double value within range
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Input must be a valid number.");
        }
    }
     
     public static <T> List<T> getSublist(int numElementsPerSublist, List<T> originalList, int pageNum) {
        if (numElementsPerSublist <= 0) {
            numElementsPerSublist = 10;
        }
        
        int index = pageNum-1;
        if (index < 0) {
             return new ArrayList<>(originalList.subList(0,numElementsPerSublist));
        }

        int totalSize = originalList.size();
        int numSublists = (int) Math.ceil((double) totalSize / numElementsPerSublist);

        if (index >= numSublists) {
            return new ArrayList<>(originalList.subList(totalSize-numElementsPerSublist, totalSize));
        }

        int start = index * numElementsPerSublist;
        int end = Math.min(start + numElementsPerSublist, totalSize);

        return new ArrayList<>(originalList.subList(start, end));
    }
}
