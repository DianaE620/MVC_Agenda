require 'csv'

class List
  def initialize
    @array = []
  end

  def add_task(task)
    tareas = []
    CSV.foreach('new_agenda.csv') do |tarea|
      tareas << tarea
    end
    
    num = tareas.length 

    CSV.open('new_agenda.csv', 'a+') do |csv|
      csv << [num + 1, task.tarea, task.status]
    end
  end

  def read_list
    array_tareas = []
    CSV.foreach('new_agenda.csv') do |tarea|
      array_tareas << tarea
    end
    array_tareas
  end

  def delete_lista(num)

    tareas = []
    CSV.foreach('new_agenda.csv') do |tarea|
      next if tarea[0] == num
      tareas << tarea
    end

    num = 1

    CSV.open('new_agenda.csv', 'wb') do |csv|
      tareas.each do |tarea|
        csv << [num, tarea[1], tarea[2]]
        num += 1
     end
    end
  end

  def complete_task(num)

    tareas = []
    CSV.foreach('new_agenda.csv') do |tarea|
      if tarea[0] == num
        tarea[2] = "cumplida"
      end
      tareas << tarea
    end

    num = 1

    CSV.open('new_agenda.csv', 'wb') do |csv|
      tareas.each do |tarea|
        csv << [num, tarea[1], tarea[2]]
        num += 1
     end
    end
    
  end

end

class Tarea
  attr_accessor :tarea, :status
  def initialize(tarea, status="pendiente")
    @tarea = tarea
    @status = status
  end

end

# class Model
#   @@num = 0

#   def create_tareas(file, array)
#     @@num = 0

#     CSV.open(file, "wb") do |csv|
#       array.each do |tarea|
#         @@num += 1
#         csv << [@@num, tarea] 
#       end
#     end
#   end

#   def add_tareas(file, array)
#     tareas = []
#     CSV.foreach(file) do |tarea|
#       tareas << tarea
#     end
#     @@num = tareas.length 

#     CSV.open(file, "a+") do |csv|
#       array.each do |tarea|
#         @@num += 1
#         csv << [@@num, tarea] 
#       end
#     end

#   end

#   def delete_tarea(file, num)
#     table = CSV.table(file)

#     table.delete_if do |row|
#       row[0] == num
#     end

#     File.open(file, 'w') do |f|
#       f.write(table.to_csv)
#     end

#   end

#   def edit_agenda(file, num)
#     agenda = []
#     CSV.foreach(file) do |tarea|
#       if tarea[0] == num.to_s
#         agenda << [num, tarea[1], "    tarea realizada"]
#       else
#         agenda << tarea
#       end
#     end
#     agenda

#     CSV.open(file, "wb") do |csv|
#        agenda.each do |tarea|
#          csv << tarea
#        end
#     end

#   end


# end



