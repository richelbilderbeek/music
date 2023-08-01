// Input: PDFs, Markdowns, etc 
// Intermediates:
//   * 00_table_of_contents.pdf 
//   * 01_maanliedje.pdf
//   * [number]_[songname].pdf
// Outputs: 
//   * An A4 book in PDF
//   * An A4 book in EPUB
//   * An A5 booklet in PDF
//   * An A5 booklet in EPUB

process create_toc() {


  """
  echo "Hello" > ${projectDir}/00_table_of_contents.pdf
  """
}


workflow {
  create_toc()

}
