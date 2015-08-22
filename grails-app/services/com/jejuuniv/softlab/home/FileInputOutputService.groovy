package com.jejuuniv.softlab.home

class FileInputOutputService {

	def textFile
	
	def writeMessage(dirName, fileName, message) {
		def dir = new File("web-app/upload_folder/admin", dirName)
		dir.mkdirs()

		textFile = new File(dir, fileName);
		FileWriter writer = new FileWriter(textFile, true);
		
		writer << System.getProperty('line.separator')
		writer << message
		writer << System.getProperty('line.separator')
		writer.close();
	
	}
	
	def readMessageList(){
		def list = []
		textFile.each {
			list.add(it) 
		}
		return list
	}
}
