
class View

  def ver_agenda(array)
    puts " Mi Agenda"
    array.each do |tareas|
      puts "#{tareas[0]}. #{tareas[1]}   Estatus: #{tareas[2]}"
    end
  end

end