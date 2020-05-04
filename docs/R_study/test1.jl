#!/opt/more/julia-1.4.1/bin/julia
open("Linear_reg_application.md") do file
   for count,ln in enumerate(eachline(file))
    if occursin(r"!\[.*",ln)
      println(ln)
      y=findnext("(",ln,1)
      println(y)
      z=findnext(r"\'",ln,1)
      println("z=$z")
      target=ln[y[1]+1:z[1]-2]
      println(target)
      path_target=join([pwd(),"/",target])
      println(path_target)
    #  read(`picgo u $path_target`)
    end
  end
end
