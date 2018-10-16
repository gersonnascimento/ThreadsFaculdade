puts 'olá'
$cd_resource = 1
$pen_drive_resource = 1

def copy_cd_files_to_pen_drive
  $cd_resource = 0
  puts 'Copiando arquivos do cd!'
  sleep(2)
  puts 'Arquivos copiados do cd!'
  paste_files 'pen_drive'
  $cd_resource = 1
end

def copy_pen_drive_files_to_cd
  $pen_drive_resource = 0
  puts 'Copiando arquivos do pen drive!'
  sleep(2)
  puts 'Arquivos copiados do pen drive!'
  paste_files 'cd'
  $pen_drive_resource = 1
end

def paste_files unit
  if unit == 'cd'
    puts 'Solicitando recurso CD-ROM'
    while $cd_resource == 0
      sleep(2)
    end
    $cd_resource = 0
    puts 'Colando arquivos no cd!'
    sleep(2)
    puts 'Arquivos colados no cd!'
    $cd_resource = 1
  elsif unit == 'pen_drive'
    puts 'Solicitando recurso PENDRIVE'
    while $pen_drive_resource == 0
      sleep(2)
    end
    $pen_drive_resource = 0
    puts 'Colando arquivos no pen drive!'
    sleep(2)
    puts 'Arquivos colados no pen drive!'
    $pen_drive_resource = 1
  end
end



cd_to_pen_drive = Thread.new{
  while $cd_resource == 0
    sleep(2)
  end
  copy_cd_files_to_pen_drive
}
pen_drive_to_cd = Thread.new{
  while $pen_drive_resource == 0
    sleep(2)
  end
  copy_pen_drive_files_to_cd
}


cd_to_pen_drive.join
pen_drive_to_cd.join
