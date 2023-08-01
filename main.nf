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
  mv 00_table_of_contents.md ${workDir}
  """
}

process create_01_maanliedje_pdf() {
  """
  ${projectDir}/scripts/create_01_maanliedje_pdf.sh
  mv 01_maanliedje_pdf ${workDir}
  """
}

workflow {
  create_00_table_of_contents_md()
  create_01_maanliedje_md()

}
