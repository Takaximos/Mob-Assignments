import 'package:http/http.dart' as http;
import'dart:convert' as convert;

class QuizBrain {


  Future<void> nextQuestion() async{
    Uri url = Uri.http('0.0.0.0:8080', '/next/');
    await http.get(url);
    }

  Future<String> getQuestionText() async{
    Uri url = Uri.http('0.0.0.0:8080', '/question/');
    var response = await http.get(url);
    if(response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<
          String,
          dynamic>;
      String question = jsonResponse['question'];
      return question;
    }

  }

  Future<bool> getCorrectAnswer() async{
    Uri url = Uri.http('0.0.0.0:8080', '/answer/');
    var response = await http.get(url);
    if(response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<
          String,
          dynamic>;
      bool answer = jsonResponse['answer'];
      return answer;
    }
  }

  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  Future<bool> isFinished() async{
    Uri url = Uri.http('0.0.0.0:8080', '/finished/');
    var response = await http.get(url);
    if(response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<
          String,
          dynamic>;
      bool isFinished = jsonResponse['question'];
      return isFinished;
    }
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  Future<void> reset() async{
    Uri url = Uri.http('0.0.0.0:8080', '/reset');
    await http.get(url);
  }
}
