local aspectRatio = display.pixelHeight / display.pixelWidth
application = {
   content = {
      width = aspectRatio > 1.5 and 800 or math.ceil( 1024 / aspectRatio ),
      height = aspectRatio < 1.5 and 1024 or math.ceil( 800 * aspectRatio ),
      scale = "letterBox",
      fps = 30,

      imageSuffix = {
         ["@2x"] = 1.3,
      },
   },
}