survey "Mapmill", :default_mandatory => false do

  section "Follow up Survey" do
    # A label is a question that accepts no answers
    label "Thank you for taking the time to contribute to our study.  Your participation is invaluable to our work.  
	As we move forward, we would like to get some feedback from you about the usability of our software so that we can 
	take your thoughts into consideration during redevelopment.  Please take a few moments to complete our brief questionnaire 
	and feel free to provide any additional comments you would like to share with us.  Thanks!!"
	
	q_1 "Did you encounter any technical problems while using the system?", :pick => :one
    a_y "Yes"
    a_n "No"
	
	q_1a "If yes, please describe: ", :custom_class => 'techdiff'
    a_1 :text
    dependency :rule => "A"
	condition_A :q_1, "==", :a_y
	
	q "How confident are you in your damage ratings?", :pick => :one
	a_1 "Not at all confident"
    a_2 "A little confident"
    a_3 "Somewhat confident"
    a_4 "Moderately confident"
	a_5 "Very confident"
	
	q "On a scale of 1 to 5 with 5 being the most enjoyment, how much did you enjoy completing this task?", :pick => :one
	a_1 "1: Tedious"
    a_2 "2: Boring"
    a_3 "3: Just OK"
    a_4 "4: Liked it"
	a_5 "5: Loved it!"
	
	q "How worthwhile do you feel this project is?", :pick => :one
	a_1 "Not at all worthwhile"
    a_2 "A little worthwhile"
    a_3 "Somewhat worthwhile"
    a_4 "Moderately worthwhile"
	a_5 "Very worthwhile"
	
	q "In the space provided, please provide any additional feedback you would like to share on this project."
	a :text, :custom_class => 'mapper'

	label "Thank you for your time and your thoughts!! "
	end
end
	