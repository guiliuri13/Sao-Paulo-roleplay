
Config = {
  RenderMax       = 5,    -- requires a gfx ("texture_1") per item in steam folder.
  RenderDist      = 50.0, -- distance to consider for rendering
  AllowCustomUrl  = true, -- allow custom urls for graffiti? NOTE: Massive potential for abuse. Also hilarious.

  Timers = {
    Piece       = 30, -- seconds
    Tag         = 10, -- seconds
    Overwrite   = 30, -- seconds
  },

  Scaleforms = {
    Sharpness = -1.0, -- -1.0 for semi-transparent background, 1.0 for solid black background.
    Width     = 0.4,  -- effects overall dui frame width.
    Height    = 0.2,  -- effects overall dui frame height.
  },

  TextureUrls = {
    -- define all images that can be painted here.
    {
      label   = "Graffiti Piece",                                 -- for esx menu
      url     = "https://i.ibb.co/BN4Gs0k/Png-Item-625994.png",   -- 
      width   = 400,                                              -- ^
      height  = 185,                                              -- ^
      tag     = false                                             -- if tag = true, painting this artwork will take half as long as usual.
    },
    {
      label   = "Graffiti Tag",
      url     = "https://i.ibb.co/mDFbxNM/tag.png",
      width   = 350,
      height  = 287,
      tag     = true
    },
  }
}

---------------------------------------------------------------
---Star Leaks https://discord.gg/xTHKYXN-----------------------
--------------------EXTRA WORLD SUCKS--------------------------

-- [[!-!]] VENDE NÃO SERGIN. MACACO BURRO [[!-!]] --