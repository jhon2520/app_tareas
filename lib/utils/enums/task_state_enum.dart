enum TaskState{
  inProgress("I N  P R O G R E S S"),
  done("D O N E"),
  undefined("U N D E F I N E D");
  

  final String labelText;

  const TaskState(this.labelText);
}