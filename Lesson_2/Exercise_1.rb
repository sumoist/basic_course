month_hash =
  {"январь" => 31, "февраль" => 29, "март" => 31, "апрель" => 30, "май" => 31, "июнь" => 30,
   "июль" => 31, "август" => 31, "сентябрь" => 30, "октябрь" => 31, "ноябрь" => 30, "декабрь" => 31}

month_hash.each do |month, day|
  puts month if day == 30
end