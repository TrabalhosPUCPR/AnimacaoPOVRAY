#include "colors.inc"  
#include "textures.inc" 
#include "transforms.inc" 
#include "woods.inc" 
#include "rand.inc"                                             
  
camera {
    location <0,5,clock-15> 
    look_at<0,5,clock> 
    Rotate_Around_Trans(<0,0,clock*10>, <0,4.5,clock-15>)
}       

#if (clock > 20 & clock < 40)
    light_source{
        <0, 4.5, clock+10> 
        Red 
        #declare cor = Red;  
        spotlight
        point_at <0,5,5>  
        radius 15
        tightness 10
    }
#end
#if (clock >= 75 | clock < 20)
    light_source{
        <0, 4.5, clock+10>
        #if(clock >= 75) 
            Cyan
            #declare cor = Cyan;
        #else
            White 
            #declare cor = White;
        #end   
        area_light <5,0,0> <0,0,5>, 5, 5
        adaptive 1 
    }      
#end
#if (clock > 40 & clock < 60)
    light_source{
        <0, 4.5, clock+10> 
        Green
        #declare cor = Green;   
        parallel
        point_at <0,0,0> 
    }      
#end   
#if (clock >= 60 & clock < 75)
    light_source{
        <0, 4.5, clock+10> 
        Magenta
        #declare cor = Magenta;    
        parallel
        point_at <5,10,0> 
    }
    light_source{
        <0, 4.5, clock+10> 
        Magenta
        #declare cor = Magenta;     
        parallel
        point_at <-5,-5,0> 
    }       
#end





#declare lugar = union{
    plane{
        <0, 1, 0>, -1
        texture{
            T_Wood15
        }   
        finish{
            diffuse 1
            
        } 
    } 
    
    plane{
        <0, -1, 0>, -10
        texture{
            T_Wood15
        }  
        finish{
            diffuse 1
            
             
        }  
    }   
    
    plane{
        <1, 0, 0>, -5  
        texture{
            T_Wood15
        } 
        finish{
            diffuse 1
            
        }   
    }
    
    plane{
        <-1, 0, 0>, -5  
        texture{
            T_Wood15
        } 
        finish{
            diffuse 1
            
        }   
    }
}

   
#declare bola = union{
   sphere{
    <0, 0, 0>, 1
        texture{     
            Gold_Metal
        }  
        finish{
            reflection .4
        } 
        rotate <0, -90, 0>
    }
    sphere{
        <0,0,0>, 0.8
        Blue
        finish{
            diffuse .4
        } 
        rotate <0, -90, 0>
   }
   clipped_by{
        sphere{
            <0,0,0>, 0.9
            translate <-0.25, 0, 0>
            inverse
        }
   }
   rotate <0,-90,0>  // PORQUE ESSE APLICATIVO N DEIXA EU SO FAZER <clock*55, -90, 0> AAAAAAAAAAAAAAAAAAAAA
   rotate <clock*55, 0, 0>   
}  

#declare bola2 = union{
   sphere{
    <0, 0, 0>, 1
        texture{     
            Gold_Metal
        }  
        finish{
            reflection .4
        } 
        rotate <clock*25, 0, 0>
    }
    sphere{
        <0,0,0>, 0.8
        Blue
        finish{
            diffuse .4
        } 
        rotate <clock*25, 3, 0>
   }
   clipped_by{
        sphere{
            <0,0,0>, 0.9
            translate <-0.25, 0, 0>
            inverse
        }
   }
   rotate <0,-90,0> 
   rotate <clock*-55, 0, 0>
} 
 
#declare bola3 = union{
   sphere{
    <0, 0, 0>, 1
        pigment{     
            White
        }  
        finish{          
            reflection .4
            phong 1
        } 
        rotate <clock*25, 0, 0>
    }
    sphere{
        <0,0,0>, 0.8
        pigment{     
            Black
        }
        finish{
            diffuse .4
        } 
        rotate <clock*25, 3, 0>
   }
   clipped_by{
        sphere{
            <0,0,0>, 0.9
            translate <-0.25, 0, 0>
            inverse
        }
   }
   rotate <0, clock*-55, 0>  
}

#declare bola4 = union{
   sphere{
    <0, 0, 0>, 1
        pigment{     
            White
        }  
        finish{          
            reflection .4
            phong 1
        } 
        rotate <clock*25, 0, 0>
    }
    sphere{
        <0,0,0>, 0.8
        pigment{     
            Black
        }
        finish{
            diffuse .4
        } 
        rotate <clock*25, 3, 0>
   }
   clipped_by{
        sphere{
            <0,0,0>, 0.9
            translate <-0.25, 0, 0>
            inverse
        }
   }
   rotate <0, clock*55, 0>  
}


#declare circulolegal = union{
#declare raio = 0.3;
#declare posX = 0;
#declare posZ = 1;
#if (clock < 1)
    #declare raio2 = 2.6*cos(clock+5);
#else
    #declare raio2 = 2.3*sin(clock);
#end
#if(raio2 < .5 | clock < 2)
    #declare nesferas = 5;
#else
    #declare nesferas = 15;
#end
#declare bolinha = sphere{<posX, raio, posZ> raio pigment {cor} finish{ambient 0.5 phong 1}}

#declare contbola = 0;

#while(contbola < 2*pi)
    #declare posX = raio2*cos(contbola);
    #declare posZ = raio2*sin(contbola);
    #declare contbola = contbola + 2*pi/nesferas;
    #declare bolinha = sphere{<posX, raio, posZ> raio pigment {cor} finish{ambient 0.5 phong 1}}
    object {bolinha translate <0, 4.5, 3>}
#end
#if (clock > 80)
    Rotate_Around_Trans(<90,0,0>, <0,4,0>)
#else
    Rotate_Around_Trans(<90,clock*25,0>, <0,4,0>)
#end
}                                                  

                    

object{lugar}
object{circulolegal translate <0, 3.5,clock >} 
object{bola translate <0, 0, clock>} 
object{bola2 translate <0, 9, clock>}  
object{bola3 translate <-4, 4.5, clock>}  
object{bola4 translate <4, 4.5, clock>}
