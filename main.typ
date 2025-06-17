// CLI Arguments ////////////////////////////////////////
// images are passed from the cli. An exmaple of how the code is run is:
//    typst compile main.typ output.png --input imageOne=1743018155-1.jpg --input imageTwo=1743018155-2.jpg --input imageThree=1743018155-3.jpg --input imageFour=1743018155-4.jpg"
#let img1 = sys.inputs.at("imageOne",   default: "top.jpg")
#let img2 = sys.inputs.at("imageTwo",   default: "middle.jpg")
#let img3 = sys.inputs.at("imageThree", default: "bottom.jpg")
#let img4 = sys.inputs.at("imageFour",  default: "top.jpg")

// CONFIGURATION ///////////////////////////////////////
#let pageHeight = 6in
#let pageWidth = 4in

// the ratio is the native aspect ratio of the images
#let ratio = 1.5
#let corner = 10pt
#let imgWidth = 1.665in

#let imgHeight = imgWidth / ratio
#let yPadding = ((pageWidth / 2) - (imgWidth)) / 2 - 1.5mm
#let xPadding = ((pageWidth / 2) - (imgWidth)) / 2 

// FUNCTIONS ///////////////////////////////////////////
#let photo(img) = {
  box(
    image(img, width: imgWidth, height: imgHeight),
    clip: true,
    radius: corner,
  )
}

#let images = (
  photo(img1),
  photo(img2),
  photo(img3),
  photo(img4),
)


#let imageColumn = block(
  grid(
    columns: 1,
    rows: 4,
    gutter: yPadding,
    ..images,
  ),
)

// LAYOUT ///////////////////////////////////////////////
#set page(
  // background: image("double_strip.png"),
  fill: rgb(51, 100, 200),
  height: pageHeight,
  width: pageWidth,
  margin: 0in,
)

#set align(center)

// Left Column
#place(
  dx: xPadding,
  dy: yPadding + .8in,
)[
  #imageColumn
]

// Right Column
#place(
  dx: xPadding + pageWidth / 2,
  dy: yPadding + 0.8in,
)[
  #grid(
    imageColumn
  )
]

#let cloud = {
  image("BBQ_Black_Yellow.png", width: 26%)
}

#place(dx: 0.03in, dy: 0.076in)[#cloud]
#place(dx: 1.9in, dy: 0.076in)[#cloud]
