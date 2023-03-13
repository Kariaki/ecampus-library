class UserNotFoundException with Exception{
  final String message;
  UserNotFoundException( this.message);
}

class UnableToPerformOperationException with Exception{
  final String message;
  UnableToPerformOperationException( this.message);
}