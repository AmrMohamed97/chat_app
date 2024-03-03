abstract class ChatStates{}
class ChatInitialState extends ChatStates{}
class ChatLoading extends ChatStates{}
class ChatSuccess extends ChatStates{}
class ChatError extends ChatStates{
  ChatError(this.error);
  final dynamic error;
}