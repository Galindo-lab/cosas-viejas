
function coord(x,y)  return {x = (x or 0);y = (y or 0)} end
function inc(x)      return x+1 end
function dec(x)      return y-1 end

function animation(id,handler,frames)
   return id+handler%60//30*(2 * frames)
end

player =
   {pos    = coord(0,0);
    map    = coord(0,0);
    frame  = 485;
    moving = false;
    flip   = 0;
    speed  = 0.6;
    
    draw = function(self)
       return
	  self.frame,
          self.pos.x,
          self.pos.y,0,1,
          self.flip
    end;

    position = function(self)
       return
	  self.pos.x + (self.map.x * 240),
          self.pos.y + (self.map.y * 136);
    end;

    move = function(self,direction)
       self.x = self.x + self.speed * direction[1]
       self.y = self.y + self.speed * direction[2]
    end;}

tile =
   {up    = { 0;-1; 7;-1};
    down  = { 0; 8; 7; 8};
    left  = {-1; 0;-1; 7};
    right = { 8; 0; 8; 0};}

dirs =
   {up    = coord( 0,-1);
    down  = coord( 0, 1);
    left  = coord(-1, 0);
    right = coord( 1, 0)}
