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


///////////////////////////////////////////////////////////////////////////////
// Create the build folder
///////////////////////////////////////////////////////////////////////////////
process create_build_folder() {
  """
  mkdir ${projectDir}/build/
  """
}

///////////////////////////////////////////////////////////////////////////////
// Create the MDs
///////////////////////////////////////////////////////////////////////////////

process create_00_table_of_contents_md() {

  """
  ${projectDir}/scripts/create_toc.sh
  mv 00_table_of_contents.md ${projectDir}/build/
  """
}

process create_01_maanliedje_md() {
  """
  sed -n '/^```/,/^```/p' \
    ${projectDir}/songs/01_maanliedje.md > \
    ${projectDir}/build/01_maanliedje.md
  """
}

///////////////////////////////////////////////////////////////////////////////
// Create the songs' PDFs
///////////////////////////////////////////////////////////////////////////////
process create_00_table_of_contents_pdf() {
  debug true

  shell:
  '''
  md_filename="!{projectDir}/build/00_table_of_contents.md"
  pdf_filename="!{projectDir}/build/00_table_of_contents.pdf"
  echo "md_filename: ${md_filename}"
  echo "pdf_filename: ${pdf_filename}"
  pandoc ${md_filename} -o ${pdf_filename}
  '''
}

process create_01_maanliedje_pdf() {
  """
  pandoc ${projectDir}/build/01_maanliedje.md -o ${projectDir}/build/01_maanliedje.pdf
  """
}

process create_xx_16777216_kleuren_pdf() {
  """
  cp ${projectDir}/songs/16777216Kleuren.pdf ${projectDir}/build/xx_16777216_kleuren.pdf
  """
}

process create_xx_dum_by_by_ant_wan_pdf() {
  """
  cp ${projectDir}/songs/Dum_by_Ant_Wan.pdf ${projectDir}/build/xx_dum_by_by_ant_wan.pdf
  """
}

///////////////////////////////////////////////////////////////////////////////
// Create the books
///////////////////////////////////////////////////////////////////////////////
process create_book_a4_pdf() {
  """
  pdfunite \
    ${projectDir}/build/00_table_of_contents.pdf \
    ${projectDir}/build/01_maanliedje.pdf \
    ${projectDir}/build/xx_16777216_kleuren.pdf \
    ${projectDir}/build/xx_dum_by_by_ant_wan.pdf \
    ${projectDir}/books/book_a4.pdf
  """
}

workflow {

  // Create the build folder
  create_build_folder()

  // Create the MDs
  create_00_table_of_contents_md()
  create_01_maanliedje_md()

  // Create the songs' PDFs
  create_00_table_of_contents_pdf()
  create_01_maanliedje_pdf()
  create_xx_16777216_kleuren_pdf()
  create_xx_dum_by_by_ant_wan_pdf()

  // Combine the PDFs
  create_book_a4_pdf()
}
