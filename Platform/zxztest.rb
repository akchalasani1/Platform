def term_condi

	book = Spreadsheet::Workbook.new
	sheet1 = book.create_worksheet :name => 'Circle_Details'

	url = URI.parse(current_url)
		#puts "#{url}"
	test = url.to_s.split('/')
		#puts test.last
	code = test.last.split('?')
	uniq_id = code.first

	if (uniq_id)
		for i in (0..1000)
			# puts "TEst current line is empty: #{sheet1.row(i).nil?}"
			# puts "Value of i: #{i}"
			# puts "#{sheet1.row(i)}"
			if (sheet1.row(i) == [])
				sheet1.row(i).push "#{uniq_id}"
				book.write 'Zrcl_test.xls'
				break
			end
			#i+=1
		end
	end

	sheet1.row(0).push "#{uniq_id}" # array variable name

	book.write 'Zrcl_test.xls'

end

