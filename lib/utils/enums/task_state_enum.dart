enum TaskState{
  inProgress("I N  P R O G R E S S", "In progress"),
  done("D O N E","Done"),
  undefined("U N D E F I N E D", "Undefined");
  

  final String labelText;
  final String normalTextText;

  const TaskState(this.labelText, this.normalTextText);
}