package tutiempo;

interface Types {}

typedef Prevision = {
    var copyright:String;
    var use:String;
    var information:Info;
    var web:String;
    var language:String;
    var locality:Locality;
    var day1:Day;
    var day2:Day;
    var day3:Day;
    var day4:Day;
    var day5:Day;
    var day6:Day;
    var day7:Day;
    var hour_hour:HourHour;
}

typedef Info = {
    var temperature:String;
    var wind:String;
    var humidity:String;
    var pressure:String;
}

typedef Locality = {
    var name:String;
    var url_weather_forecast_15_days:String;
    var url_hourly_forecast:String;
    var country:String;
    var url_country:String;
}

typedef Day = {
    var date:String;
    var temperature_max:UInt;
    var temperature_min:UInt;
    var icon:String;
    var text:String;
    var humidity:UInt;
    var wind:UInt;
    var wind_direction:String;
    var icon_wind:String;
    var sunrise:String;
    var sunset:String;
    var moonrise:String;
    var moonset:String;
    var moon_phases_icon:String;
}

typedef Hour = {
    var date:String;
    var hour_data:String;
    var temperature:UInt;
    var text:String;
    var humidity:UInt;
    var pressure:UInt;
    var icon:String;
    var wind:UInt;
    var wind_direction:String;
    var icon_wind:String;
}

typedef HourHour = {
    var hour1:Hour;
    var hour2:Hour;
    var hour3:Hour;
    var hour4:Hour;
    var hour5:Hour;
    var hour6:Hour;
    var hour7:Hour;
    var hour8:Hour;
    var hour9:Hour;
    var hour10:Hour;
    var hour12:Hour;
    var hour13:Hour;
    var hour14:Hour;
    var hour15:Hour;
    var hour16:Hour;
    var hour17:Hour;
    var hour18:Hour;
    var hour19:Hour;
    var hour20:Hour;
    var hour21:Hour;
    var hour22:Hour;
    var hour23:Hour;
    var hour24:Hour;
    var hour25:Hour;
}