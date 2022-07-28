
abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppDatabaseCreated extends AppStates{}

class AppDatabaseTableCreated extends AppStates{}

class AppDatabaseOpened extends AppStates{}

class AppDatabaseTaskCreated extends AppStates{}

class AppDatabaseTasks extends AppStates{}

class AppDatabaseLoading extends AppStates{}
class AppDatabaseTasksStatus extends AppStates{}
class AppDatabaseTasksDeleted extends AppStates{}