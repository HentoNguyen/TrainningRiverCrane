 class TableCSVExport{
 	constructor(table, includeHeaders = true){
 		this.table = table;
 		this.rows = Array.from(table.querySelectorAll("tr"));
 		
 		if(!includeHeaders && this.rows[0].querySelectorAll("th").length){
 			this.rows.shift();
 			}
 			console.log(this._findLongestRowLength ());
 		}
 		
 		convertToCSV(){
 		
 		}
 		
 		_findLongestRowLength () {
 			
     	}
 		
 		static pareCell (tableCell){
 		
 		}
 	
 
 }