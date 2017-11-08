<?php

require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Ods;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Writer\Csv;

class Office {

  public function getSpreadsheet() {
    return new Spreadsheet();
  }

  public function getOdsWriter(Spreadsheet $spreadsheet) {
    return new Ods($spreadsheet);
  }

  public function getExcelWriter(Spreadsheet $spreadsheet) {
    return new Xlsx($spreadsheet);
  }

  public function getCsvWriter(Spreadsheet $spreadsheet) {
    return new Csv($spreadsheet);
  }

}

