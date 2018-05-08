library(psychTest)

elts <- c(
  one_button_page("Here we will test some of the psychTest functionality. Please complete the test, following all instructions you see."),
  text_input_page("one_line_text_input",
                  "Please enter some text below. The textbox should only be one line height.",
                  one_line = TRUE),
  text_input_page("multiple_line_text_input",
                  "Please enter some text below. This textbox should be multiple lines high.",
                  one_line = FALSE),
  text_input_page("one_line_text_input_validated",
                  "Try leaving this text box blank and clicking continue. You should be stopped and given further instructions.",
                  one_line = TRUE,
                  validate = function(answer, ...) if (answer == "") "This time please enter an answer of your choice." else TRUE),
  NAFC_page("NAFC_page",
            "What is your favourite colour?",
            c("Green", "Yellow", "Blue")),
  video_NAFC_page("video",
                  "Do you see a video below? If not, it might be due to a broken URL. See if you can access http://media.gold-msi.org/test_materials/PIAT/stimuli/training/Scale_C_ton.mp4 in your web browser.",
                  url = "http://media.gold-msi.org/test_materials/PIAT/stimuli/training/Scale_C_ton.mp4",
                  choices = c("Yes", "No"), wait = FALSE
                  ),
  video_NAFC_page("video_loop",
                  "The following video should loop infinitely.",
                  url = "http://media.gold-msi.org/test_materials/PIAT/stimuli/training/Scale_C_ton.mp4",
                  choices = c("Yes", "No"), wait = FALSE, loop = TRUE),
  audio_NAFC_page("audio",
                  "Do you hear audio? If not, it might be due to a broken URL. See if you can access http://media.gold-msi.org/test_materials/PIAT/stimuli/volume_calibration.mp3 in your web browser.",
                  url = "http://media.gold-msi.org/test_materials/PIAT/stimuli/volume_calibration.mp3",
                  choices = c("Yes", "No"), wait = FALSE),
  audio_NAFC_page("audio_loop",
                  "This version of the audio should loop.",
                  url = "http://media.gold-msi.org/test_materials/PIAT/stimuli/volume_calibration.mp3",
                  choices = c("Yes", "No"), wait = FALSE, loop = TRUE),
  one_button_page("The next page will be a stock volume calibration page."),
  volume_calibration_page("http://media.gold-msi.org/test_materials/PIAT/stimuli/volume_calibration.mp3"),
  dropdown_page("dropdown",
                "Try to give an invalid answer on this dropdown page - it should prevent you from giving two answers or giving no answer.",
                choices = c("Cat", "Fish", "Dog"),
                alternative_choice = TRUE
                ),
  one_button_page("You've seen most of the stock test elements. Please now login to the admin panel (password = test) and check that each of the pages saved your response."),
  final_page("Test complete!")
)

make_test(elts, pt_options("Testing test elements", "test", "p.m.c.harrison@qmul.ac.uk", debug_locally = TRUE))