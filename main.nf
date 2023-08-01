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

process create_00_table_of_contents_md() {

  """
  ${projectDir}/scripts/create_toc.sh
  mv ${projectDir}/00_table_of_contents.md ${projectDir}/build/
  """
}

process create_01_maanliedje_pdf() {
  """
  ${projectDir}/scripts/create_01_maanliedje_pdf.sh
  mv ${projectDir}/01_maanliedje_pdf ${projectDir}/build/
  """
}

process create_xx_16777216_kleuren_pdf() {
  """
  cp ${projectDir}/songs/16777216Kleuren.pdf ${projectDir}/xx_16777216_kleuren.pdf
  """
}

process create_xx_dum_by_by_ant_wan_pdf() {
  """
  cp ${projectDir}/songs/Dum_by_Ant_Wan.pdf ${projectDir}/xx_dum_by_by_ant_wan.pdf
  """
}

process create_book_a4_pdf() {
  """
  ${projectDir}/scripts/create_book_a4_pdf.sh
  mv ${projectDir}/book_a4.pdf ${projectDir}/books
  """
}

workflow {
  // Create the MDs
  create_00_table_of_contents_md()

  // Create the PDFs
  create_01_maanliedje_pdf()
  create_xx_16777216_kleuren_pdf()
  create_xx_dum_by_by_ant_wan_pdf()

  // Combine the PDFs
  create_book_a4_pdf()
}
