class MyConverter{
  static String durationToText(Duration duration){
    try{
      int sec = duration.inSeconds;
      if(sec == 0){
        return '00:00';
      }else{
        int min = sec~/60;
        int remSec = sec%60;
        String finalMin = '';
        String finalSec = '';
        if(min > 9){
          finalMin = '$min';
        }else{
          finalMin = '0$min';
        }

        if(remSec > 9){
          finalSec = '$remSec';
        }else{
          finalSec = '0$remSec';
        }
        return '$finalMin:$finalSec';
      }
    }catch(e){
      return '00:00';
    }
  }

  static double getPosition(Duration position, Duration duration){
    int pSec = position.inSeconds;
    int dSec = duration.inSeconds;
    return pSec/dSec;
  }
}