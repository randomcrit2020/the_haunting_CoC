// Define your variables once
#let title = "The Haunting"
#let author = "Edgar M. Miranda"
#let doc_date = datetime.today()

// Set PDF metadata using the variables
#set document(
  title: title,
  author: author,
  date: auto,
)

#set page("us-letter", numbering: none)  // No numbering on cover page
#set text(font: "Arno Pro", size: 14pt, lang: "es")
#show heading: set block(above: 1.4em, below: 1.4em)
#set par(
  leading: 1em,         // More space between lines
  spacing: 1.5em        // More space between paragraphs
)

// Set font and other properties for all headings
#show heading: set text(
  font: "Teutonic",
  weight: "bold",
  size: 20pt
)

// Make level 1 headings start on a new page
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  it
}

// Cover page - reuse the variables
#align(center + horizon)[
  #text(font: "Teutonic", size: 20pt, weight: "bold")[Call of Cthulu 7th ed]

  #text(font: "Teutonic", size: 28pt, weight: "bold")[#title]
  
  #v(1em)
  #text(size: 12pt)[#author]
  #v(1em)
  #text(size: 12pt)[#doc_date.display("[month repr:long] [day], [year]")]
]

#pagebreak()

// Enable page numbering starting from page 2
#set page(numbering: "1")
#counter(page).update(1)  // Reset counter to start at 1

// Table of Contents
// Add spacing between all outline entries

// Enable automatic numbering for headings
#set heading(numbering: "1.1.")

#show outline.entry.where(level: 1): set block(above: 1.5em)
#show outline.entry.where(level: 2): set block(above: 1.0em)
#outline()


#pagebreak()

// Using a for loop to include handouts
#for i in range(1, 10) {
  include("handouts/handout" + str(i) + ".typ")
}

// Using a for loop to include locations
#for i in range(1, 10) {
  include("locations/location" + str(i) + ".typ")
}




// == Lorem
// #lorem(85)

// #lorem(75)

// == lorrr
// #lorem(100)