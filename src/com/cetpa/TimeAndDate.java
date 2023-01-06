package com.cetpa;
import java.time.LocalDate;
import java.time.LocalTime;

public class TimeAndDate 
{
	public static String getCurrentTime()
	{
		LocalTime lt=LocalTime.now();
		String time=lt.getHour()+":"+lt.getMinute()+":"+lt.getSecond();
		return time;
	}
	public static String getCurrentDate()
	{
		LocalDate ld=LocalDate.now();
		String date=ld.getDayOfMonth()+"-"+ld.getMonthValue()+"-"+ld.getYear();
		return date;
	}
	public static String getTotalTime(String intime,String outtime)
	{
		String[] in=intime.split(":");
		int x=totalSeconds(in);
		String[] out=outtime.split(":");
		int y=totalSeconds(out);
		int t=x-y;
		String total=t/60+" min and "+t%60+" sec";
		return total;
	}
	private static int totalSeconds(String [] time)
	{
		int total=Integer.parseInt(time[0])*60*60+Integer.parseInt(time[1])*60+Integer.parseInt(time[2]);
		return total;
	}
	public static String changeDateFormat(String date)
	{
		String[] x=date.split("-");
		date=Integer.parseInt(x[2])+"-"+Integer.parseInt(x[1])+"-"+x[0];
		return date;
	}
}
