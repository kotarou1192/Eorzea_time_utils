class ET
  # 1秒 = 1000ms
  MILLISECONDS_PER_SECOND = 1000
  # 1時間 = 60分
  MINUTES_PER_HOUR = 60
  # 1日 = 24時間
  HOURS_PER_DATE = 24
  # 1年 = 12ヶ月
  MONTHS_PER_YEAR = 12
  # 1分をミリ秒で表現
  A_MINUTE_TO_MILISECONDS = MILLISECONDS_PER_SECOND * 60
  # 1時間をミリ秒で表現
  MILLISECONDS_PER_HOUR = A_MINUTE_TO_MILISECONDS * MINUTES_PER_HOUR

  # エオルゼアの1ヶ月は32日
  DATES_PER_EORZEA_MONTH = 32
  # エオルゼアの24時間は70分
  EORZEA_DAY_PER_REAL_DAY = 24 * 60 / 70.0
  # エオルゼアの1日をミリ秒で表現
  MILLISECONDS_PER_EORZEA_DATE = MILLISECONDS_PER_HOUR * 24
  # エオルゼアの1ヶ月をミリ秒で表現
  MILLISECONDS_PER_EORZEA_MONTH = MILLISECONDS_PER_EORZEA_DATE * DATES_PER_EORZEA_MONTH

  def initialize
    # UNIX時間をミリ秒で
    unix_time = Time.new.utc.to_f * MILLISECONDS_PER_SECOND
    @total_times_since_birth = unix_time * EORZEA_DAY_PER_REAL_DAY
  end

  def getHours
    eorzean_hour = (@total_times_since_birth / MILLISECONDS_PER_HOUR) % HOURS_PER_DATE
    eorzean_hour.floor
  end

  def getMinutes
    eorzean_minutes = (@total_times_since_birth / A_MINUTE_TO_MILISECONDS) % MINUTES_PER_HOUR
    eorzean_minutes.floor
  end

  def getSeconds
    eorzean_seconds = (@total_times_since_birth / MILLISECONDS_PER_SECOND) % A_MINUTE_TO_MILISECONDS
    eorzean_seconds.floor
  end

  def to_s
    "#{getHours}:#{getMinutes}.#{getSeconds}"
  end
end
