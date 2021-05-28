// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String name;
  final DateTime created_at;
  final bool status;
  Task(
      {@required this.id,
      @required this.name,
      this.created_at,
      @required this.status});
  factory Task.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Task(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      status:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<bool>(status);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory Task.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      status: serializer.fromJson<bool>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'created_at': serializer.toJson<DateTime>(created_at),
      'status': serializer.toJson<bool>(status),
    };
  }

  Task copyWith({int id, String name, DateTime created_at, bool status}) =>
      Task(
        id: id ?? this.id,
        name: name ?? this.name,
        created_at: created_at ?? this.created_at,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created_at: $created_at, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(created_at.hashCode, status.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.name == this.name &&
          other.created_at == this.created_at &&
          other.status == this.status);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> created_at;
  final Value<bool> status;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.created_at = const Value.absent(),
    this.status = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.created_at = const Value.absent(),
    this.status = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Task> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<DateTime> created_at,
    Expression<bool> status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (created_at != null) 'created_at': created_at,
      if (status != null) 'status': status,
    });
  }

  TasksCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<DateTime> created_at,
      Value<bool> status}) {
    return TasksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      created_at: created_at ?? this.created_at,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('created_at: $created_at, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  final GeneratedDatabase _db;
  final String _alias;
  $TasksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedBoolColumn _status;
  @override
  GeneratedBoolColumn get status => _status ??= _constructStatus();
  GeneratedBoolColumn _constructStatus() {
    return GeneratedBoolColumn('status', $tableName, false,
        defaultValue: Constant(false));
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, created_at, status];
  @override
  $TasksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tasks';
  @override
  final String actualTableName = 'tasks';
  @override
  VerificationContext validateIntegrity(Insertable<Task> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Task.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(_db, alias);
  }
}

class Permission extends DataClass implements Insertable<Permission> {
  final int id;
  final String descripcion;
  final DateTime created_at;
  final int status;
  Permission(
      {@required this.id,
      @required this.descripcion,
      this.created_at,
      @required this.status});
  factory Permission.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Permission(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      descripcion: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descripcion']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    return map;
  }

  PermissionsCompanion toCompanion(bool nullToAbsent) {
    return PermissionsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory Permission.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Permission(
      id: serializer.fromJson<int>(json['id']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descripcion': serializer.toJson<String>(descripcion),
      'created_at': serializer.toJson<DateTime>(created_at),
      'status': serializer.toJson<int>(status),
    };
  }

  Permission copyWith(
          {int id, String descripcion, DateTime created_at, int status}) =>
      Permission(
        id: id ?? this.id,
        descripcion: descripcion ?? this.descripcion,
        created_at: created_at ?? this.created_at,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('Permission(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('created_at: $created_at, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          descripcion.hashCode, $mrjc(created_at.hashCode, status.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Permission &&
          other.id == this.id &&
          other.descripcion == this.descripcion &&
          other.created_at == this.created_at &&
          other.status == this.status);
}

class PermissionsCompanion extends UpdateCompanion<Permission> {
  final Value<int> id;
  final Value<String> descripcion;
  final Value<DateTime> created_at;
  final Value<int> status;
  const PermissionsCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.created_at = const Value.absent(),
    this.status = const Value.absent(),
  });
  PermissionsCompanion.insert({
    this.id = const Value.absent(),
    @required String descripcion,
    this.created_at = const Value.absent(),
    @required int status,
  })  : descripcion = Value(descripcion),
        status = Value(status);
  static Insertable<Permission> custom({
    Expression<int> id,
    Expression<String> descripcion,
    Expression<DateTime> created_at,
    Expression<int> status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
      if (created_at != null) 'created_at': created_at,
      if (status != null) 'status': status,
    });
  }

  PermissionsCompanion copyWith(
      {Value<int> id,
      Value<String> descripcion,
      Value<DateTime> created_at,
      Value<int> status}) {
    return PermissionsCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      created_at: created_at ?? this.created_at,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PermissionsCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('created_at: $created_at, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $PermissionsTable extends Permissions
    with TableInfo<$PermissionsTable, Permission> {
  final GeneratedDatabase _db;
  final String _alias;
  $PermissionsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  GeneratedTextColumn _descripcion;
  @override
  GeneratedTextColumn get descripcion =>
      _descripcion ??= _constructDescripcion();
  GeneratedTextColumn _constructDescripcion() {
    return GeneratedTextColumn(
      'descripcion',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn(
      'status',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, descripcion, created_at, status];
  @override
  $PermissionsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'permissions';
  @override
  final String actualTableName = 'permissions';
  @override
  VerificationContext validateIntegrity(Insertable<Permission> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion'], _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Permission map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Permission.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $PermissionsTable createAlias(String alias) {
    return $PermissionsTable(_db, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String usuario;
  final String servidor;
  final DateTime created_at;
  final int status;
  User(
      {@required this.id,
      @required this.usuario,
      @required this.servidor,
      this.created_at,
      @required this.status});
  factory User.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return User(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      usuario:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}usuario']),
      servidor: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}servidor']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || usuario != null) {
      map['usuario'] = Variable<String>(usuario);
    }
    if (!nullToAbsent || servidor != null) {
      map['servidor'] = Variable<String>(servidor);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      usuario: usuario == null && nullToAbsent
          ? const Value.absent()
          : Value(usuario),
      servidor: servidor == null && nullToAbsent
          ? const Value.absent()
          : Value(servidor),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      usuario: serializer.fromJson<String>(json['usuario']),
      servidor: serializer.fromJson<String>(json['servidor']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'usuario': serializer.toJson<String>(usuario),
      'servidor': serializer.toJson<String>(servidor),
      'created_at': serializer.toJson<DateTime>(created_at),
      'status': serializer.toJson<int>(status),
    };
  }

  User copyWith(
          {int id,
          String usuario,
          String servidor,
          DateTime created_at,
          int status}) =>
      User(
        id: id ?? this.id,
        usuario: usuario ?? this.usuario,
        servidor: servidor ?? this.servidor,
        created_at: created_at ?? this.created_at,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('usuario: $usuario, ')
          ..write('servidor: $servidor, ')
          ..write('created_at: $created_at, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          usuario.hashCode,
          $mrjc(servidor.hashCode,
              $mrjc(created_at.hashCode, status.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.usuario == this.usuario &&
          other.servidor == this.servidor &&
          other.created_at == this.created_at &&
          other.status == this.status);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> usuario;
  final Value<String> servidor;
  final Value<DateTime> created_at;
  final Value<int> status;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.usuario = const Value.absent(),
    this.servidor = const Value.absent(),
    this.created_at = const Value.absent(),
    this.status = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    @required String usuario,
    @required String servidor,
    this.created_at = const Value.absent(),
    @required int status,
  })  : usuario = Value(usuario),
        servidor = Value(servidor),
        status = Value(status);
  static Insertable<User> custom({
    Expression<int> id,
    Expression<String> usuario,
    Expression<String> servidor,
    Expression<DateTime> created_at,
    Expression<int> status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (usuario != null) 'usuario': usuario,
      if (servidor != null) 'servidor': servidor,
      if (created_at != null) 'created_at': created_at,
      if (status != null) 'status': status,
    });
  }

  UsersCompanion copyWith(
      {Value<int> id,
      Value<String> usuario,
      Value<String> servidor,
      Value<DateTime> created_at,
      Value<int> status}) {
    return UsersCompanion(
      id: id ?? this.id,
      usuario: usuario ?? this.usuario,
      servidor: servidor ?? this.servidor,
      created_at: created_at ?? this.created_at,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (usuario.present) {
      map['usuario'] = Variable<String>(usuario.value);
    }
    if (servidor.present) {
      map['servidor'] = Variable<String>(servidor.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('usuario: $usuario, ')
          ..write('servidor: $servidor, ')
          ..write('created_at: $created_at, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  final GeneratedDatabase _db;
  final String _alias;
  $UsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _usuarioMeta = const VerificationMeta('usuario');
  GeneratedTextColumn _usuario;
  @override
  GeneratedTextColumn get usuario => _usuario ??= _constructUsuario();
  GeneratedTextColumn _constructUsuario() {
    return GeneratedTextColumn(
      'usuario',
      $tableName,
      false,
    );
  }

  final VerificationMeta _servidorMeta = const VerificationMeta('servidor');
  GeneratedTextColumn _servidor;
  @override
  GeneratedTextColumn get servidor => _servidor ??= _constructServidor();
  GeneratedTextColumn _constructServidor() {
    return GeneratedTextColumn(
      'servidor',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn(
      'status',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, usuario, servidor, created_at, status];
  @override
  $UsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'users';
  @override
  final String actualTableName = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('usuario')) {
      context.handle(_usuarioMeta,
          usuario.isAcceptableOrUnknown(data['usuario'], _usuarioMeta));
    } else if (isInserting) {
      context.missing(_usuarioMeta);
    }
    if (data.containsKey('servidor')) {
      context.handle(_servidorMeta,
          servidor.isAcceptableOrUnknown(data['servidor'], _servidorMeta));
    } else if (isInserting) {
      context.missing(_servidorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return User.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(_db, alias);
  }
}

class Setting extends DataClass implements Insertable<Setting> {
  final int id;
  final String consorcio;
  final int idTipoFormatoTicket;
  final int imprimirNombreConsorcio;
  final String descripcionTipoFormatoTicket;
  final int cancelarTicketWhatsapp;
  final int imprimirNombreBanca;
  Setting(
      {@required this.id,
      @required this.consorcio,
      @required this.idTipoFormatoTicket,
      @required this.imprimirNombreConsorcio,
      @required this.descripcionTipoFormatoTicket,
      @required this.cancelarTicketWhatsapp,
      @required this.imprimirNombreBanca});
  factory Setting.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Setting(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      consorcio: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}consorcio']),
      idTipoFormatoTicket: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}id_tipo_formato_ticket']),
      imprimirNombreConsorcio: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}imprimir_nombre_consorcio']),
      descripcionTipoFormatoTicket: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}descripcion_tipo_formato_ticket']),
      cancelarTicketWhatsapp: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}cancelar_ticket_whatsapp']),
      imprimirNombreBanca: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}imprimir_nombre_banca']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || consorcio != null) {
      map['consorcio'] = Variable<String>(consorcio);
    }
    if (!nullToAbsent || idTipoFormatoTicket != null) {
      map['id_tipo_formato_ticket'] = Variable<int>(idTipoFormatoTicket);
    }
    if (!nullToAbsent || imprimirNombreConsorcio != null) {
      map['imprimir_nombre_consorcio'] = Variable<int>(imprimirNombreConsorcio);
    }
    if (!nullToAbsent || descripcionTipoFormatoTicket != null) {
      map['descripcion_tipo_formato_ticket'] =
          Variable<String>(descripcionTipoFormatoTicket);
    }
    if (!nullToAbsent || cancelarTicketWhatsapp != null) {
      map['cancelar_ticket_whatsapp'] = Variable<int>(cancelarTicketWhatsapp);
    }
    if (!nullToAbsent || imprimirNombreBanca != null) {
      map['imprimir_nombre_banca'] = Variable<int>(imprimirNombreBanca);
    }
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      consorcio: consorcio == null && nullToAbsent
          ? const Value.absent()
          : Value(consorcio),
      idTipoFormatoTicket: idTipoFormatoTicket == null && nullToAbsent
          ? const Value.absent()
          : Value(idTipoFormatoTicket),
      imprimirNombreConsorcio: imprimirNombreConsorcio == null && nullToAbsent
          ? const Value.absent()
          : Value(imprimirNombreConsorcio),
      descripcionTipoFormatoTicket:
          descripcionTipoFormatoTicket == null && nullToAbsent
              ? const Value.absent()
              : Value(descripcionTipoFormatoTicket),
      cancelarTicketWhatsapp: cancelarTicketWhatsapp == null && nullToAbsent
          ? const Value.absent()
          : Value(cancelarTicketWhatsapp),
      imprimirNombreBanca: imprimirNombreBanca == null && nullToAbsent
          ? const Value.absent()
          : Value(imprimirNombreBanca),
    );
  }

  factory Setting.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Setting(
      id: serializer.fromJson<int>(json['id']),
      consorcio: serializer.fromJson<String>(json['consorcio']),
      idTipoFormatoTicket:
          serializer.fromJson<int>(json['idTipoFormatoTicket']),
      imprimirNombreConsorcio:
          serializer.fromJson<int>(json['imprimirNombreConsorcio']),
      descripcionTipoFormatoTicket:
          serializer.fromJson<String>(json['descripcionTipoFormatoTicket']),
      cancelarTicketWhatsapp:
          serializer.fromJson<int>(json['cancelarTicketWhatsapp']),
      imprimirNombreBanca:
          serializer.fromJson<int>(json['imprimirNombreBanca']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'consorcio': serializer.toJson<String>(consorcio),
      'idTipoFormatoTicket': serializer.toJson<int>(idTipoFormatoTicket),
      'imprimirNombreConsorcio':
          serializer.toJson<int>(imprimirNombreConsorcio),
      'descripcionTipoFormatoTicket':
          serializer.toJson<String>(descripcionTipoFormatoTicket),
      'cancelarTicketWhatsapp': serializer.toJson<int>(cancelarTicketWhatsapp),
      'imprimirNombreBanca': serializer.toJson<int>(imprimirNombreBanca),
    };
  }

  Setting copyWith(
          {int id,
          String consorcio,
          int idTipoFormatoTicket,
          int imprimirNombreConsorcio,
          String descripcionTipoFormatoTicket,
          int cancelarTicketWhatsapp,
          int imprimirNombreBanca}) =>
      Setting(
        id: id ?? this.id,
        consorcio: consorcio ?? this.consorcio,
        idTipoFormatoTicket: idTipoFormatoTicket ?? this.idTipoFormatoTicket,
        imprimirNombreConsorcio:
            imprimirNombreConsorcio ?? this.imprimirNombreConsorcio,
        descripcionTipoFormatoTicket:
            descripcionTipoFormatoTicket ?? this.descripcionTipoFormatoTicket,
        cancelarTicketWhatsapp:
            cancelarTicketWhatsapp ?? this.cancelarTicketWhatsapp,
        imprimirNombreBanca: imprimirNombreBanca ?? this.imprimirNombreBanca,
      );
  @override
  String toString() {
    return (StringBuffer('Setting(')
          ..write('id: $id, ')
          ..write('consorcio: $consorcio, ')
          ..write('idTipoFormatoTicket: $idTipoFormatoTicket, ')
          ..write('imprimirNombreConsorcio: $imprimirNombreConsorcio, ')
          ..write(
              'descripcionTipoFormatoTicket: $descripcionTipoFormatoTicket, ')
          ..write('cancelarTicketWhatsapp: $cancelarTicketWhatsapp, ')
          ..write('imprimirNombreBanca: $imprimirNombreBanca')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          consorcio.hashCode,
          $mrjc(
              idTipoFormatoTicket.hashCode,
              $mrjc(
                  imprimirNombreConsorcio.hashCode,
                  $mrjc(
                      descripcionTipoFormatoTicket.hashCode,
                      $mrjc(cancelarTicketWhatsapp.hashCode,
                          imprimirNombreBanca.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Setting &&
          other.id == this.id &&
          other.consorcio == this.consorcio &&
          other.idTipoFormatoTicket == this.idTipoFormatoTicket &&
          other.imprimirNombreConsorcio == this.imprimirNombreConsorcio &&
          other.descripcionTipoFormatoTicket ==
              this.descripcionTipoFormatoTicket &&
          other.cancelarTicketWhatsapp == this.cancelarTicketWhatsapp &&
          other.imprimirNombreBanca == this.imprimirNombreBanca);
}

class SettingsCompanion extends UpdateCompanion<Setting> {
  final Value<int> id;
  final Value<String> consorcio;
  final Value<int> idTipoFormatoTicket;
  final Value<int> imprimirNombreConsorcio;
  final Value<String> descripcionTipoFormatoTicket;
  final Value<int> cancelarTicketWhatsapp;
  final Value<int> imprimirNombreBanca;
  const SettingsCompanion({
    this.id = const Value.absent(),
    this.consorcio = const Value.absent(),
    this.idTipoFormatoTicket = const Value.absent(),
    this.imprimirNombreConsorcio = const Value.absent(),
    this.descripcionTipoFormatoTicket = const Value.absent(),
    this.cancelarTicketWhatsapp = const Value.absent(),
    this.imprimirNombreBanca = const Value.absent(),
  });
  SettingsCompanion.insert({
    this.id = const Value.absent(),
    @required String consorcio,
    @required int idTipoFormatoTicket,
    @required int imprimirNombreConsorcio,
    @required String descripcionTipoFormatoTicket,
    @required int cancelarTicketWhatsapp,
    @required int imprimirNombreBanca,
  })  : consorcio = Value(consorcio),
        idTipoFormatoTicket = Value(idTipoFormatoTicket),
        imprimirNombreConsorcio = Value(imprimirNombreConsorcio),
        descripcionTipoFormatoTicket = Value(descripcionTipoFormatoTicket),
        cancelarTicketWhatsapp = Value(cancelarTicketWhatsapp),
        imprimirNombreBanca = Value(imprimirNombreBanca);
  static Insertable<Setting> custom({
    Expression<int> id,
    Expression<String> consorcio,
    Expression<int> idTipoFormatoTicket,
    Expression<int> imprimirNombreConsorcio,
    Expression<String> descripcionTipoFormatoTicket,
    Expression<int> cancelarTicketWhatsapp,
    Expression<int> imprimirNombreBanca,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (consorcio != null) 'consorcio': consorcio,
      if (idTipoFormatoTicket != null)
        'id_tipo_formato_ticket': idTipoFormatoTicket,
      if (imprimirNombreConsorcio != null)
        'imprimir_nombre_consorcio': imprimirNombreConsorcio,
      if (descripcionTipoFormatoTicket != null)
        'descripcion_tipo_formato_ticket': descripcionTipoFormatoTicket,
      if (cancelarTicketWhatsapp != null)
        'cancelar_ticket_whatsapp': cancelarTicketWhatsapp,
      if (imprimirNombreBanca != null)
        'imprimir_nombre_banca': imprimirNombreBanca,
    });
  }

  SettingsCompanion copyWith(
      {Value<int> id,
      Value<String> consorcio,
      Value<int> idTipoFormatoTicket,
      Value<int> imprimirNombreConsorcio,
      Value<String> descripcionTipoFormatoTicket,
      Value<int> cancelarTicketWhatsapp,
      Value<int> imprimirNombreBanca}) {
    return SettingsCompanion(
      id: id ?? this.id,
      consorcio: consorcio ?? this.consorcio,
      idTipoFormatoTicket: idTipoFormatoTicket ?? this.idTipoFormatoTicket,
      imprimirNombreConsorcio:
          imprimirNombreConsorcio ?? this.imprimirNombreConsorcio,
      descripcionTipoFormatoTicket:
          descripcionTipoFormatoTicket ?? this.descripcionTipoFormatoTicket,
      cancelarTicketWhatsapp:
          cancelarTicketWhatsapp ?? this.cancelarTicketWhatsapp,
      imprimirNombreBanca: imprimirNombreBanca ?? this.imprimirNombreBanca,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (consorcio.present) {
      map['consorcio'] = Variable<String>(consorcio.value);
    }
    if (idTipoFormatoTicket.present) {
      map['id_tipo_formato_ticket'] = Variable<int>(idTipoFormatoTicket.value);
    }
    if (imprimirNombreConsorcio.present) {
      map['imprimir_nombre_consorcio'] =
          Variable<int>(imprimirNombreConsorcio.value);
    }
    if (descripcionTipoFormatoTicket.present) {
      map['descripcion_tipo_formato_ticket'] =
          Variable<String>(descripcionTipoFormatoTicket.value);
    }
    if (cancelarTicketWhatsapp.present) {
      map['cancelar_ticket_whatsapp'] =
          Variable<int>(cancelarTicketWhatsapp.value);
    }
    if (imprimirNombreBanca.present) {
      map['imprimir_nombre_banca'] = Variable<int>(imprimirNombreBanca.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('id: $id, ')
          ..write('consorcio: $consorcio, ')
          ..write('idTipoFormatoTicket: $idTipoFormatoTicket, ')
          ..write('imprimirNombreConsorcio: $imprimirNombreConsorcio, ')
          ..write(
              'descripcionTipoFormatoTicket: $descripcionTipoFormatoTicket, ')
          ..write('cancelarTicketWhatsapp: $cancelarTicketWhatsapp, ')
          ..write('imprimirNombreBanca: $imprimirNombreBanca')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings with TableInfo<$SettingsTable, Setting> {
  final GeneratedDatabase _db;
  final String _alias;
  $SettingsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _consorcioMeta = const VerificationMeta('consorcio');
  GeneratedTextColumn _consorcio;
  @override
  GeneratedTextColumn get consorcio => _consorcio ??= _constructConsorcio();
  GeneratedTextColumn _constructConsorcio() {
    return GeneratedTextColumn(
      'consorcio',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idTipoFormatoTicketMeta =
      const VerificationMeta('idTipoFormatoTicket');
  GeneratedIntColumn _idTipoFormatoTicket;
  @override
  GeneratedIntColumn get idTipoFormatoTicket =>
      _idTipoFormatoTicket ??= _constructIdTipoFormatoTicket();
  GeneratedIntColumn _constructIdTipoFormatoTicket() {
    return GeneratedIntColumn(
      'id_tipo_formato_ticket',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imprimirNombreConsorcioMeta =
      const VerificationMeta('imprimirNombreConsorcio');
  GeneratedIntColumn _imprimirNombreConsorcio;
  @override
  GeneratedIntColumn get imprimirNombreConsorcio =>
      _imprimirNombreConsorcio ??= _constructImprimirNombreConsorcio();
  GeneratedIntColumn _constructImprimirNombreConsorcio() {
    return GeneratedIntColumn(
      'imprimir_nombre_consorcio',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descripcionTipoFormatoTicketMeta =
      const VerificationMeta('descripcionTipoFormatoTicket');
  GeneratedTextColumn _descripcionTipoFormatoTicket;
  @override
  GeneratedTextColumn get descripcionTipoFormatoTicket =>
      _descripcionTipoFormatoTicket ??=
          _constructDescripcionTipoFormatoTicket();
  GeneratedTextColumn _constructDescripcionTipoFormatoTicket() {
    return GeneratedTextColumn(
      'descripcion_tipo_formato_ticket',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cancelarTicketWhatsappMeta =
      const VerificationMeta('cancelarTicketWhatsapp');
  GeneratedIntColumn _cancelarTicketWhatsapp;
  @override
  GeneratedIntColumn get cancelarTicketWhatsapp =>
      _cancelarTicketWhatsapp ??= _constructCancelarTicketWhatsapp();
  GeneratedIntColumn _constructCancelarTicketWhatsapp() {
    return GeneratedIntColumn(
      'cancelar_ticket_whatsapp',
      $tableName,
      false,
    );
  }

  final VerificationMeta _imprimirNombreBancaMeta =
      const VerificationMeta('imprimirNombreBanca');
  GeneratedIntColumn _imprimirNombreBanca;
  @override
  GeneratedIntColumn get imprimirNombreBanca =>
      _imprimirNombreBanca ??= _constructImprimirNombreBanca();
  GeneratedIntColumn _constructImprimirNombreBanca() {
    return GeneratedIntColumn(
      'imprimir_nombre_banca',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        consorcio,
        idTipoFormatoTicket,
        imprimirNombreConsorcio,
        descripcionTipoFormatoTicket,
        cancelarTicketWhatsapp,
        imprimirNombreBanca
      ];
  @override
  $SettingsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'settings';
  @override
  final String actualTableName = 'settings';
  @override
  VerificationContext validateIntegrity(Insertable<Setting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('consorcio')) {
      context.handle(_consorcioMeta,
          consorcio.isAcceptableOrUnknown(data['consorcio'], _consorcioMeta));
    } else if (isInserting) {
      context.missing(_consorcioMeta);
    }
    if (data.containsKey('id_tipo_formato_ticket')) {
      context.handle(
          _idTipoFormatoTicketMeta,
          idTipoFormatoTicket.isAcceptableOrUnknown(
              data['id_tipo_formato_ticket'], _idTipoFormatoTicketMeta));
    } else if (isInserting) {
      context.missing(_idTipoFormatoTicketMeta);
    }
    if (data.containsKey('imprimir_nombre_consorcio')) {
      context.handle(
          _imprimirNombreConsorcioMeta,
          imprimirNombreConsorcio.isAcceptableOrUnknown(
              data['imprimir_nombre_consorcio'], _imprimirNombreConsorcioMeta));
    } else if (isInserting) {
      context.missing(_imprimirNombreConsorcioMeta);
    }
    if (data.containsKey('descripcion_tipo_formato_ticket')) {
      context.handle(
          _descripcionTipoFormatoTicketMeta,
          descripcionTipoFormatoTicket.isAcceptableOrUnknown(
              data['descripcion_tipo_formato_ticket'],
              _descripcionTipoFormatoTicketMeta));
    } else if (isInserting) {
      context.missing(_descripcionTipoFormatoTicketMeta);
    }
    if (data.containsKey('cancelar_ticket_whatsapp')) {
      context.handle(
          _cancelarTicketWhatsappMeta,
          cancelarTicketWhatsapp.isAcceptableOrUnknown(
              data['cancelar_ticket_whatsapp'], _cancelarTicketWhatsappMeta));
    } else if (isInserting) {
      context.missing(_cancelarTicketWhatsappMeta);
    }
    if (data.containsKey('imprimir_nombre_banca')) {
      context.handle(
          _imprimirNombreBancaMeta,
          imprimirNombreBanca.isAcceptableOrUnknown(
              data['imprimir_nombre_banca'], _imprimirNombreBancaMeta));
    } else if (isInserting) {
      context.missing(_imprimirNombreBancaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Setting map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Setting.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(_db, alias);
  }
}

class Branch extends DataClass implements Insertable<Branch> {
  final int id;
  final int idMoneda;
  final String descripcion;
  final String codigo;
  final String moneda;
  final String monedaAbreviatura;
  final String monedaColor;
  final double descontar;
  final double deCada;
  final DateTime created_at;
  final int status;
  Branch(
      {@required this.id,
      @required this.idMoneda,
      @required this.descripcion,
      @required this.codigo,
      @required this.moneda,
      @required this.monedaAbreviatura,
      @required this.monedaColor,
      @required this.descontar,
      @required this.deCada,
      this.created_at,
      @required this.status});
  factory Branch.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Branch(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idMoneda:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_moneda']),
      descripcion: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descripcion']),
      codigo:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}codigo']),
      moneda:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}moneda']),
      monedaAbreviatura: stringType.mapFromDatabaseResponse(
          data['${effectivePrefix}moneda_abreviatura']),
      monedaColor: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}moneda_color']),
      descontar: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}descontar']),
      deCada:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}de_cada']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idMoneda != null) {
      map['id_moneda'] = Variable<int>(idMoneda);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || codigo != null) {
      map['codigo'] = Variable<String>(codigo);
    }
    if (!nullToAbsent || moneda != null) {
      map['moneda'] = Variable<String>(moneda);
    }
    if (!nullToAbsent || monedaAbreviatura != null) {
      map['moneda_abreviatura'] = Variable<String>(monedaAbreviatura);
    }
    if (!nullToAbsent || monedaColor != null) {
      map['moneda_color'] = Variable<String>(monedaColor);
    }
    if (!nullToAbsent || descontar != null) {
      map['descontar'] = Variable<double>(descontar);
    }
    if (!nullToAbsent || deCada != null) {
      map['de_cada'] = Variable<double>(deCada);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    return map;
  }

  BranchsCompanion toCompanion(bool nullToAbsent) {
    return BranchsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idMoneda: idMoneda == null && nullToAbsent
          ? const Value.absent()
          : Value(idMoneda),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      codigo:
          codigo == null && nullToAbsent ? const Value.absent() : Value(codigo),
      moneda:
          moneda == null && nullToAbsent ? const Value.absent() : Value(moneda),
      monedaAbreviatura: monedaAbreviatura == null && nullToAbsent
          ? const Value.absent()
          : Value(monedaAbreviatura),
      monedaColor: monedaColor == null && nullToAbsent
          ? const Value.absent()
          : Value(monedaColor),
      descontar: descontar == null && nullToAbsent
          ? const Value.absent()
          : Value(descontar),
      deCada:
          deCada == null && nullToAbsent ? const Value.absent() : Value(deCada),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory Branch.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Branch(
      id: serializer.fromJson<int>(json['id']),
      idMoneda: serializer.fromJson<int>(json['idMoneda']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      codigo: serializer.fromJson<String>(json['codigo']),
      moneda: serializer.fromJson<String>(json['moneda']),
      monedaAbreviatura: serializer.fromJson<String>(json['monedaAbreviatura']),
      monedaColor: serializer.fromJson<String>(json['monedaColor']),
      descontar: serializer.fromJson<double>(json['descontar']),
      deCada: serializer.fromJson<double>(json['deCada']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idMoneda': serializer.toJson<int>(idMoneda),
      'descripcion': serializer.toJson<String>(descripcion),
      'codigo': serializer.toJson<String>(codigo),
      'moneda': serializer.toJson<String>(moneda),
      'monedaAbreviatura': serializer.toJson<String>(monedaAbreviatura),
      'monedaColor': serializer.toJson<String>(monedaColor),
      'descontar': serializer.toJson<double>(descontar),
      'deCada': serializer.toJson<double>(deCada),
      'created_at': serializer.toJson<DateTime>(created_at),
      'status': serializer.toJson<int>(status),
    };
  }

  Branch copyWith(
          {int id,
          int idMoneda,
          String descripcion,
          String codigo,
          String moneda,
          String monedaAbreviatura,
          String monedaColor,
          double descontar,
          double deCada,
          DateTime created_at,
          int status}) =>
      Branch(
        id: id ?? this.id,
        idMoneda: idMoneda ?? this.idMoneda,
        descripcion: descripcion ?? this.descripcion,
        codigo: codigo ?? this.codigo,
        moneda: moneda ?? this.moneda,
        monedaAbreviatura: monedaAbreviatura ?? this.monedaAbreviatura,
        monedaColor: monedaColor ?? this.monedaColor,
        descontar: descontar ?? this.descontar,
        deCada: deCada ?? this.deCada,
        created_at: created_at ?? this.created_at,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('Branch(')
          ..write('id: $id, ')
          ..write('idMoneda: $idMoneda, ')
          ..write('descripcion: $descripcion, ')
          ..write('codigo: $codigo, ')
          ..write('moneda: $moneda, ')
          ..write('monedaAbreviatura: $monedaAbreviatura, ')
          ..write('monedaColor: $monedaColor, ')
          ..write('descontar: $descontar, ')
          ..write('deCada: $deCada, ')
          ..write('created_at: $created_at, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idMoneda.hashCode,
          $mrjc(
              descripcion.hashCode,
              $mrjc(
                  codigo.hashCode,
                  $mrjc(
                      moneda.hashCode,
                      $mrjc(
                          monedaAbreviatura.hashCode,
                          $mrjc(
                              monedaColor.hashCode,
                              $mrjc(
                                  descontar.hashCode,
                                  $mrjc(
                                      deCada.hashCode,
                                      $mrjc(created_at.hashCode,
                                          status.hashCode)))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Branch &&
          other.id == this.id &&
          other.idMoneda == this.idMoneda &&
          other.descripcion == this.descripcion &&
          other.codigo == this.codigo &&
          other.moneda == this.moneda &&
          other.monedaAbreviatura == this.monedaAbreviatura &&
          other.monedaColor == this.monedaColor &&
          other.descontar == this.descontar &&
          other.deCada == this.deCada &&
          other.created_at == this.created_at &&
          other.status == this.status);
}

class BranchsCompanion extends UpdateCompanion<Branch> {
  final Value<int> id;
  final Value<int> idMoneda;
  final Value<String> descripcion;
  final Value<String> codigo;
  final Value<String> moneda;
  final Value<String> monedaAbreviatura;
  final Value<String> monedaColor;
  final Value<double> descontar;
  final Value<double> deCada;
  final Value<DateTime> created_at;
  final Value<int> status;
  const BranchsCompanion({
    this.id = const Value.absent(),
    this.idMoneda = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.codigo = const Value.absent(),
    this.moneda = const Value.absent(),
    this.monedaAbreviatura = const Value.absent(),
    this.monedaColor = const Value.absent(),
    this.descontar = const Value.absent(),
    this.deCada = const Value.absent(),
    this.created_at = const Value.absent(),
    this.status = const Value.absent(),
  });
  BranchsCompanion.insert({
    this.id = const Value.absent(),
    @required int idMoneda,
    @required String descripcion,
    @required String codigo,
    @required String moneda,
    @required String monedaAbreviatura,
    @required String monedaColor,
    @required double descontar,
    @required double deCada,
    this.created_at = const Value.absent(),
    @required int status,
  })  : idMoneda = Value(idMoneda),
        descripcion = Value(descripcion),
        codigo = Value(codigo),
        moneda = Value(moneda),
        monedaAbreviatura = Value(monedaAbreviatura),
        monedaColor = Value(monedaColor),
        descontar = Value(descontar),
        deCada = Value(deCada),
        status = Value(status);
  static Insertable<Branch> custom({
    Expression<int> id,
    Expression<int> idMoneda,
    Expression<String> descripcion,
    Expression<String> codigo,
    Expression<String> moneda,
    Expression<String> monedaAbreviatura,
    Expression<String> monedaColor,
    Expression<double> descontar,
    Expression<double> deCada,
    Expression<DateTime> created_at,
    Expression<int> status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idMoneda != null) 'id_moneda': idMoneda,
      if (descripcion != null) 'descripcion': descripcion,
      if (codigo != null) 'codigo': codigo,
      if (moneda != null) 'moneda': moneda,
      if (monedaAbreviatura != null) 'moneda_abreviatura': monedaAbreviatura,
      if (monedaColor != null) 'moneda_color': monedaColor,
      if (descontar != null) 'descontar': descontar,
      if (deCada != null) 'de_cada': deCada,
      if (created_at != null) 'created_at': created_at,
      if (status != null) 'status': status,
    });
  }

  BranchsCompanion copyWith(
      {Value<int> id,
      Value<int> idMoneda,
      Value<String> descripcion,
      Value<String> codigo,
      Value<String> moneda,
      Value<String> monedaAbreviatura,
      Value<String> monedaColor,
      Value<double> descontar,
      Value<double> deCada,
      Value<DateTime> created_at,
      Value<int> status}) {
    return BranchsCompanion(
      id: id ?? this.id,
      idMoneda: idMoneda ?? this.idMoneda,
      descripcion: descripcion ?? this.descripcion,
      codigo: codigo ?? this.codigo,
      moneda: moneda ?? this.moneda,
      monedaAbreviatura: monedaAbreviatura ?? this.monedaAbreviatura,
      monedaColor: monedaColor ?? this.monedaColor,
      descontar: descontar ?? this.descontar,
      deCada: deCada ?? this.deCada,
      created_at: created_at ?? this.created_at,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idMoneda.present) {
      map['id_moneda'] = Variable<int>(idMoneda.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<String>(codigo.value);
    }
    if (moneda.present) {
      map['moneda'] = Variable<String>(moneda.value);
    }
    if (monedaAbreviatura.present) {
      map['moneda_abreviatura'] = Variable<String>(monedaAbreviatura.value);
    }
    if (monedaColor.present) {
      map['moneda_color'] = Variable<String>(monedaColor.value);
    }
    if (descontar.present) {
      map['descontar'] = Variable<double>(descontar.value);
    }
    if (deCada.present) {
      map['de_cada'] = Variable<double>(deCada.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BranchsCompanion(')
          ..write('id: $id, ')
          ..write('idMoneda: $idMoneda, ')
          ..write('descripcion: $descripcion, ')
          ..write('codigo: $codigo, ')
          ..write('moneda: $moneda, ')
          ..write('monedaAbreviatura: $monedaAbreviatura, ')
          ..write('monedaColor: $monedaColor, ')
          ..write('descontar: $descontar, ')
          ..write('deCada: $deCada, ')
          ..write('created_at: $created_at, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $BranchsTable extends Branchs with TableInfo<$BranchsTable, Branch> {
  final GeneratedDatabase _db;
  final String _alias;
  $BranchsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMonedaMeta = const VerificationMeta('idMoneda');
  GeneratedIntColumn _idMoneda;
  @override
  GeneratedIntColumn get idMoneda => _idMoneda ??= _constructIdMoneda();
  GeneratedIntColumn _constructIdMoneda() {
    return GeneratedIntColumn(
      'id_moneda',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  GeneratedTextColumn _descripcion;
  @override
  GeneratedTextColumn get descripcion =>
      _descripcion ??= _constructDescripcion();
  GeneratedTextColumn _constructDescripcion() {
    return GeneratedTextColumn(
      'descripcion',
      $tableName,
      false,
    );
  }

  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  GeneratedTextColumn _codigo;
  @override
  GeneratedTextColumn get codigo => _codigo ??= _constructCodigo();
  GeneratedTextColumn _constructCodigo() {
    return GeneratedTextColumn(
      'codigo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monedaMeta = const VerificationMeta('moneda');
  GeneratedTextColumn _moneda;
  @override
  GeneratedTextColumn get moneda => _moneda ??= _constructMoneda();
  GeneratedTextColumn _constructMoneda() {
    return GeneratedTextColumn(
      'moneda',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monedaAbreviaturaMeta =
      const VerificationMeta('monedaAbreviatura');
  GeneratedTextColumn _monedaAbreviatura;
  @override
  GeneratedTextColumn get monedaAbreviatura =>
      _monedaAbreviatura ??= _constructMonedaAbreviatura();
  GeneratedTextColumn _constructMonedaAbreviatura() {
    return GeneratedTextColumn(
      'moneda_abreviatura',
      $tableName,
      false,
    );
  }

  final VerificationMeta _monedaColorMeta =
      const VerificationMeta('monedaColor');
  GeneratedTextColumn _monedaColor;
  @override
  GeneratedTextColumn get monedaColor =>
      _monedaColor ??= _constructMonedaColor();
  GeneratedTextColumn _constructMonedaColor() {
    return GeneratedTextColumn(
      'moneda_color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descontarMeta = const VerificationMeta('descontar');
  GeneratedRealColumn _descontar;
  @override
  GeneratedRealColumn get descontar => _descontar ??= _constructDescontar();
  GeneratedRealColumn _constructDescontar() {
    return GeneratedRealColumn(
      'descontar',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deCadaMeta = const VerificationMeta('deCada');
  GeneratedRealColumn _deCada;
  @override
  GeneratedRealColumn get deCada => _deCada ??= _constructDeCada();
  GeneratedRealColumn _constructDeCada() {
    return GeneratedRealColumn(
      'de_cada',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn(
      'status',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idMoneda,
        descripcion,
        codigo,
        moneda,
        monedaAbreviatura,
        monedaColor,
        descontar,
        deCada,
        created_at,
        status
      ];
  @override
  $BranchsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'branchs';
  @override
  final String actualTableName = 'branchs';
  @override
  VerificationContext validateIntegrity(Insertable<Branch> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_moneda')) {
      context.handle(_idMonedaMeta,
          idMoneda.isAcceptableOrUnknown(data['id_moneda'], _idMonedaMeta));
    } else if (isInserting) {
      context.missing(_idMonedaMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion'], _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo'], _codigoMeta));
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    if (data.containsKey('moneda')) {
      context.handle(_monedaMeta,
          moneda.isAcceptableOrUnknown(data['moneda'], _monedaMeta));
    } else if (isInserting) {
      context.missing(_monedaMeta);
    }
    if (data.containsKey('moneda_abreviatura')) {
      context.handle(
          _monedaAbreviaturaMeta,
          monedaAbreviatura.isAcceptableOrUnknown(
              data['moneda_abreviatura'], _monedaAbreviaturaMeta));
    } else if (isInserting) {
      context.missing(_monedaAbreviaturaMeta);
    }
    if (data.containsKey('moneda_color')) {
      context.handle(
          _monedaColorMeta,
          monedaColor.isAcceptableOrUnknown(
              data['moneda_color'], _monedaColorMeta));
    } else if (isInserting) {
      context.missing(_monedaColorMeta);
    }
    if (data.containsKey('descontar')) {
      context.handle(_descontarMeta,
          descontar.isAcceptableOrUnknown(data['descontar'], _descontarMeta));
    } else if (isInserting) {
      context.missing(_descontarMeta);
    }
    if (data.containsKey('de_cada')) {
      context.handle(_deCadaMeta,
          deCada.isAcceptableOrUnknown(data['de_cada'], _deCadaMeta));
    } else if (isInserting) {
      context.missing(_deCadaMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Branch map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Branch.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BranchsTable createAlias(String alias) {
    return $BranchsTable(_db, alias);
  }
}

class Server extends DataClass implements Insertable<Server> {
  final int id;
  final String descripcion;
  final DateTime created_at;
  final int pordefecto;
  Server(
      {@required this.id,
      @required this.descripcion,
      this.created_at,
      @required this.pordefecto});
  factory Server.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Server(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      descripcion: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descripcion']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      pordefecto:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}pordefecto']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || pordefecto != null) {
      map['pordefecto'] = Variable<int>(pordefecto);
    }
    return map;
  }

  ServersCompanion toCompanion(bool nullToAbsent) {
    return ServersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      pordefecto: pordefecto == null && nullToAbsent
          ? const Value.absent()
          : Value(pordefecto),
    );
  }

  factory Server.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Server(
      id: serializer.fromJson<int>(json['id']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      pordefecto: serializer.fromJson<int>(json['pordefecto']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descripcion': serializer.toJson<String>(descripcion),
      'created_at': serializer.toJson<DateTime>(created_at),
      'pordefecto': serializer.toJson<int>(pordefecto),
    };
  }

  Server copyWith(
          {int id, String descripcion, DateTime created_at, int pordefecto}) =>
      Server(
        id: id ?? this.id,
        descripcion: descripcion ?? this.descripcion,
        created_at: created_at ?? this.created_at,
        pordefecto: pordefecto ?? this.pordefecto,
      );
  @override
  String toString() {
    return (StringBuffer('Server(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('created_at: $created_at, ')
          ..write('pordefecto: $pordefecto')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(descripcion.hashCode,
          $mrjc(created_at.hashCode, pordefecto.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Server &&
          other.id == this.id &&
          other.descripcion == this.descripcion &&
          other.created_at == this.created_at &&
          other.pordefecto == this.pordefecto);
}

class ServersCompanion extends UpdateCompanion<Server> {
  final Value<int> id;
  final Value<String> descripcion;
  final Value<DateTime> created_at;
  final Value<int> pordefecto;
  const ServersCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.created_at = const Value.absent(),
    this.pordefecto = const Value.absent(),
  });
  ServersCompanion.insert({
    this.id = const Value.absent(),
    @required String descripcion,
    this.created_at = const Value.absent(),
    @required int pordefecto,
  })  : descripcion = Value(descripcion),
        pordefecto = Value(pordefecto);
  static Insertable<Server> custom({
    Expression<int> id,
    Expression<String> descripcion,
    Expression<DateTime> created_at,
    Expression<int> pordefecto,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
      if (created_at != null) 'created_at': created_at,
      if (pordefecto != null) 'pordefecto': pordefecto,
    });
  }

  ServersCompanion copyWith(
      {Value<int> id,
      Value<String> descripcion,
      Value<DateTime> created_at,
      Value<int> pordefecto}) {
    return ServersCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      created_at: created_at ?? this.created_at,
      pordefecto: pordefecto ?? this.pordefecto,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (pordefecto.present) {
      map['pordefecto'] = Variable<int>(pordefecto.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServersCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('created_at: $created_at, ')
          ..write('pordefecto: $pordefecto')
          ..write(')'))
        .toString();
  }
}

class $ServersTable extends Servers with TableInfo<$ServersTable, Server> {
  final GeneratedDatabase _db;
  final String _alias;
  $ServersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  GeneratedTextColumn _descripcion;
  @override
  GeneratedTextColumn get descripcion =>
      _descripcion ??= _constructDescripcion();
  GeneratedTextColumn _constructDescripcion() {
    return GeneratedTextColumn(
      'descripcion',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _pordefectoMeta = const VerificationMeta('pordefecto');
  GeneratedIntColumn _pordefecto;
  @override
  GeneratedIntColumn get pordefecto => _pordefecto ??= _constructPordefecto();
  GeneratedIntColumn _constructPordefecto() {
    return GeneratedIntColumn(
      'pordefecto',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, descripcion, created_at, pordefecto];
  @override
  $ServersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'servers';
  @override
  final String actualTableName = 'servers';
  @override
  VerificationContext validateIntegrity(Insertable<Server> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion'], _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('pordefecto')) {
      context.handle(
          _pordefectoMeta,
          pordefecto.isAcceptableOrUnknown(
              data['pordefecto'], _pordefectoMeta));
    } else if (isInserting) {
      context.missing(_pordefectoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Server map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Server.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ServersTable createAlias(String alias) {
    return $ServersTable(_db, alias);
  }
}

class Stock extends DataClass implements Insertable<Stock> {
  final int id;
  final int idBanca;
  final int idLoteria;
  final int idLoteriaSuperpale;
  final int idSorteo;
  final String jugada;
  final double montoInicial;
  final double monto;
  final DateTime created_at;
  final int esBloqueoJugada;
  final int esGeneral;
  final int ignorarDemasBloqueos;
  final int idMoneda;
  Stock(
      {@required this.id,
      @required this.idBanca,
      @required this.idLoteria,
      @required this.idLoteriaSuperpale,
      @required this.idSorteo,
      @required this.jugada,
      @required this.montoInicial,
      @required this.monto,
      this.created_at,
      @required this.esBloqueoJugada,
      @required this.esGeneral,
      @required this.ignorarDemasBloqueos,
      @required this.idMoneda});
  factory Stock.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Stock(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idBanca:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_banca']),
      idLoteria:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_loteria']),
      idLoteriaSuperpale: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}id_loteria_superpale']),
      idSorteo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_sorteo']),
      jugada:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}jugada']),
      montoInicial: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}monto_inicial']),
      monto:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}monto']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      esBloqueoJugada: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}es_bloqueo_jugada']),
      esGeneral:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}es_general']),
      ignorarDemasBloqueos: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}ignorar_demas_bloqueos']),
      idMoneda:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_moneda']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idBanca != null) {
      map['id_banca'] = Variable<int>(idBanca);
    }
    if (!nullToAbsent || idLoteria != null) {
      map['id_loteria'] = Variable<int>(idLoteria);
    }
    if (!nullToAbsent || idLoteriaSuperpale != null) {
      map['id_loteria_superpale'] = Variable<int>(idLoteriaSuperpale);
    }
    if (!nullToAbsent || idSorteo != null) {
      map['id_sorteo'] = Variable<int>(idSorteo);
    }
    if (!nullToAbsent || jugada != null) {
      map['jugada'] = Variable<String>(jugada);
    }
    if (!nullToAbsent || montoInicial != null) {
      map['monto_inicial'] = Variable<double>(montoInicial);
    }
    if (!nullToAbsent || monto != null) {
      map['monto'] = Variable<double>(monto);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || esBloqueoJugada != null) {
      map['es_bloqueo_jugada'] = Variable<int>(esBloqueoJugada);
    }
    if (!nullToAbsent || esGeneral != null) {
      map['es_general'] = Variable<int>(esGeneral);
    }
    if (!nullToAbsent || ignorarDemasBloqueos != null) {
      map['ignorar_demas_bloqueos'] = Variable<int>(ignorarDemasBloqueos);
    }
    if (!nullToAbsent || idMoneda != null) {
      map['id_moneda'] = Variable<int>(idMoneda);
    }
    return map;
  }

  StocksCompanion toCompanion(bool nullToAbsent) {
    return StocksCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idBanca: idBanca == null && nullToAbsent
          ? const Value.absent()
          : Value(idBanca),
      idLoteria: idLoteria == null && nullToAbsent
          ? const Value.absent()
          : Value(idLoteria),
      idLoteriaSuperpale: idLoteriaSuperpale == null && nullToAbsent
          ? const Value.absent()
          : Value(idLoteriaSuperpale),
      idSorteo: idSorteo == null && nullToAbsent
          ? const Value.absent()
          : Value(idSorteo),
      jugada:
          jugada == null && nullToAbsent ? const Value.absent() : Value(jugada),
      montoInicial: montoInicial == null && nullToAbsent
          ? const Value.absent()
          : Value(montoInicial),
      monto:
          monto == null && nullToAbsent ? const Value.absent() : Value(monto),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      esBloqueoJugada: esBloqueoJugada == null && nullToAbsent
          ? const Value.absent()
          : Value(esBloqueoJugada),
      esGeneral: esGeneral == null && nullToAbsent
          ? const Value.absent()
          : Value(esGeneral),
      ignorarDemasBloqueos: ignorarDemasBloqueos == null && nullToAbsent
          ? const Value.absent()
          : Value(ignorarDemasBloqueos),
      idMoneda: idMoneda == null && nullToAbsent
          ? const Value.absent()
          : Value(idMoneda),
    );
  }

  factory Stock.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Stock(
      id: serializer.fromJson<int>(json['id']),
      idBanca: serializer.fromJson<int>(json['idBanca']),
      idLoteria: serializer.fromJson<int>(json['idLoteria']),
      idLoteriaSuperpale: serializer.fromJson<int>(json['idLoteriaSuperpale']),
      idSorteo: serializer.fromJson<int>(json['idSorteo']),
      jugada: serializer.fromJson<String>(json['jugada']),
      montoInicial: serializer.fromJson<double>(json['montoInicial']),
      monto: serializer.fromJson<double>(json['monto']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      esBloqueoJugada: serializer.fromJson<int>(json['esBloqueoJugada']),
      esGeneral: serializer.fromJson<int>(json['esGeneral']),
      ignorarDemasBloqueos:
          serializer.fromJson<int>(json['ignorarDemasBloqueos']),
      idMoneda: serializer.fromJson<int>(json['idMoneda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idBanca': serializer.toJson<int>(idBanca),
      'idLoteria': serializer.toJson<int>(idLoteria),
      'idLoteriaSuperpale': serializer.toJson<int>(idLoteriaSuperpale),
      'idSorteo': serializer.toJson<int>(idSorteo),
      'jugada': serializer.toJson<String>(jugada),
      'montoInicial': serializer.toJson<double>(montoInicial),
      'monto': serializer.toJson<double>(monto),
      'created_at': serializer.toJson<DateTime>(created_at),
      'esBloqueoJugada': serializer.toJson<int>(esBloqueoJugada),
      'esGeneral': serializer.toJson<int>(esGeneral),
      'ignorarDemasBloqueos': serializer.toJson<int>(ignorarDemasBloqueos),
      'idMoneda': serializer.toJson<int>(idMoneda),
    };
  }

  Stock copyWith(
          {int id,
          int idBanca,
          int idLoteria,
          int idLoteriaSuperpale,
          int idSorteo,
          String jugada,
          double montoInicial,
          double monto,
          DateTime created_at,
          int esBloqueoJugada,
          int esGeneral,
          int ignorarDemasBloqueos,
          int idMoneda}) =>
      Stock(
        id: id ?? this.id,
        idBanca: idBanca ?? this.idBanca,
        idLoteria: idLoteria ?? this.idLoteria,
        idLoteriaSuperpale: idLoteriaSuperpale ?? this.idLoteriaSuperpale,
        idSorteo: idSorteo ?? this.idSorteo,
        jugada: jugada ?? this.jugada,
        montoInicial: montoInicial ?? this.montoInicial,
        monto: monto ?? this.monto,
        created_at: created_at ?? this.created_at,
        esBloqueoJugada: esBloqueoJugada ?? this.esBloqueoJugada,
        esGeneral: esGeneral ?? this.esGeneral,
        ignorarDemasBloqueos: ignorarDemasBloqueos ?? this.ignorarDemasBloqueos,
        idMoneda: idMoneda ?? this.idMoneda,
      );
  @override
  String toString() {
    return (StringBuffer('Stock(')
          ..write('id: $id, ')
          ..write('idBanca: $idBanca, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idLoteriaSuperpale: $idLoteriaSuperpale, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('jugada: $jugada, ')
          ..write('montoInicial: $montoInicial, ')
          ..write('monto: $monto, ')
          ..write('created_at: $created_at, ')
          ..write('esBloqueoJugada: $esBloqueoJugada, ')
          ..write('esGeneral: $esGeneral, ')
          ..write('ignorarDemasBloqueos: $ignorarDemasBloqueos, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idBanca.hashCode,
          $mrjc(
              idLoteria.hashCode,
              $mrjc(
                  idLoteriaSuperpale.hashCode,
                  $mrjc(
                      idSorteo.hashCode,
                      $mrjc(
                          jugada.hashCode,
                          $mrjc(
                              montoInicial.hashCode,
                              $mrjc(
                                  monto.hashCode,
                                  $mrjc(
                                      created_at.hashCode,
                                      $mrjc(
                                          esBloqueoJugada.hashCode,
                                          $mrjc(
                                              esGeneral.hashCode,
                                              $mrjc(
                                                  ignorarDemasBloqueos.hashCode,
                                                  idMoneda
                                                      .hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Stock &&
          other.id == this.id &&
          other.idBanca == this.idBanca &&
          other.idLoteria == this.idLoteria &&
          other.idLoteriaSuperpale == this.idLoteriaSuperpale &&
          other.idSorteo == this.idSorteo &&
          other.jugada == this.jugada &&
          other.montoInicial == this.montoInicial &&
          other.monto == this.monto &&
          other.created_at == this.created_at &&
          other.esBloqueoJugada == this.esBloqueoJugada &&
          other.esGeneral == this.esGeneral &&
          other.ignorarDemasBloqueos == this.ignorarDemasBloqueos &&
          other.idMoneda == this.idMoneda);
}

class StocksCompanion extends UpdateCompanion<Stock> {
  final Value<int> id;
  final Value<int> idBanca;
  final Value<int> idLoteria;
  final Value<int> idLoteriaSuperpale;
  final Value<int> idSorteo;
  final Value<String> jugada;
  final Value<double> montoInicial;
  final Value<double> monto;
  final Value<DateTime> created_at;
  final Value<int> esBloqueoJugada;
  final Value<int> esGeneral;
  final Value<int> ignorarDemasBloqueos;
  final Value<int> idMoneda;
  const StocksCompanion({
    this.id = const Value.absent(),
    this.idBanca = const Value.absent(),
    this.idLoteria = const Value.absent(),
    this.idLoteriaSuperpale = const Value.absent(),
    this.idSorteo = const Value.absent(),
    this.jugada = const Value.absent(),
    this.montoInicial = const Value.absent(),
    this.monto = const Value.absent(),
    this.created_at = const Value.absent(),
    this.esBloqueoJugada = const Value.absent(),
    this.esGeneral = const Value.absent(),
    this.ignorarDemasBloqueos = const Value.absent(),
    this.idMoneda = const Value.absent(),
  });
  StocksCompanion.insert({
    this.id = const Value.absent(),
    @required int idBanca,
    @required int idLoteria,
    @required int idLoteriaSuperpale,
    @required int idSorteo,
    @required String jugada,
    @required double montoInicial,
    @required double monto,
    this.created_at = const Value.absent(),
    @required int esBloqueoJugada,
    @required int esGeneral,
    @required int ignorarDemasBloqueos,
    @required int idMoneda,
  })  : idBanca = Value(idBanca),
        idLoteria = Value(idLoteria),
        idLoteriaSuperpale = Value(idLoteriaSuperpale),
        idSorteo = Value(idSorteo),
        jugada = Value(jugada),
        montoInicial = Value(montoInicial),
        monto = Value(monto),
        esBloqueoJugada = Value(esBloqueoJugada),
        esGeneral = Value(esGeneral),
        ignorarDemasBloqueos = Value(ignorarDemasBloqueos),
        idMoneda = Value(idMoneda);
  static Insertable<Stock> custom({
    Expression<int> id,
    Expression<int> idBanca,
    Expression<int> idLoteria,
    Expression<int> idLoteriaSuperpale,
    Expression<int> idSorteo,
    Expression<String> jugada,
    Expression<double> montoInicial,
    Expression<double> monto,
    Expression<DateTime> created_at,
    Expression<int> esBloqueoJugada,
    Expression<int> esGeneral,
    Expression<int> ignorarDemasBloqueos,
    Expression<int> idMoneda,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idBanca != null) 'id_banca': idBanca,
      if (idLoteria != null) 'id_loteria': idLoteria,
      if (idLoteriaSuperpale != null)
        'id_loteria_superpale': idLoteriaSuperpale,
      if (idSorteo != null) 'id_sorteo': idSorteo,
      if (jugada != null) 'jugada': jugada,
      if (montoInicial != null) 'monto_inicial': montoInicial,
      if (monto != null) 'monto': monto,
      if (created_at != null) 'created_at': created_at,
      if (esBloqueoJugada != null) 'es_bloqueo_jugada': esBloqueoJugada,
      if (esGeneral != null) 'es_general': esGeneral,
      if (ignorarDemasBloqueos != null)
        'ignorar_demas_bloqueos': ignorarDemasBloqueos,
      if (idMoneda != null) 'id_moneda': idMoneda,
    });
  }

  StocksCompanion copyWith(
      {Value<int> id,
      Value<int> idBanca,
      Value<int> idLoteria,
      Value<int> idLoteriaSuperpale,
      Value<int> idSorteo,
      Value<String> jugada,
      Value<double> montoInicial,
      Value<double> monto,
      Value<DateTime> created_at,
      Value<int> esBloqueoJugada,
      Value<int> esGeneral,
      Value<int> ignorarDemasBloqueos,
      Value<int> idMoneda}) {
    return StocksCompanion(
      id: id ?? this.id,
      idBanca: idBanca ?? this.idBanca,
      idLoteria: idLoteria ?? this.idLoteria,
      idLoteriaSuperpale: idLoteriaSuperpale ?? this.idLoteriaSuperpale,
      idSorteo: idSorteo ?? this.idSorteo,
      jugada: jugada ?? this.jugada,
      montoInicial: montoInicial ?? this.montoInicial,
      monto: monto ?? this.monto,
      created_at: created_at ?? this.created_at,
      esBloqueoJugada: esBloqueoJugada ?? this.esBloqueoJugada,
      esGeneral: esGeneral ?? this.esGeneral,
      ignorarDemasBloqueos: ignorarDemasBloqueos ?? this.ignorarDemasBloqueos,
      idMoneda: idMoneda ?? this.idMoneda,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idBanca.present) {
      map['id_banca'] = Variable<int>(idBanca.value);
    }
    if (idLoteria.present) {
      map['id_loteria'] = Variable<int>(idLoteria.value);
    }
    if (idLoteriaSuperpale.present) {
      map['id_loteria_superpale'] = Variable<int>(idLoteriaSuperpale.value);
    }
    if (idSorteo.present) {
      map['id_sorteo'] = Variable<int>(idSorteo.value);
    }
    if (jugada.present) {
      map['jugada'] = Variable<String>(jugada.value);
    }
    if (montoInicial.present) {
      map['monto_inicial'] = Variable<double>(montoInicial.value);
    }
    if (monto.present) {
      map['monto'] = Variable<double>(monto.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (esBloqueoJugada.present) {
      map['es_bloqueo_jugada'] = Variable<int>(esBloqueoJugada.value);
    }
    if (esGeneral.present) {
      map['es_general'] = Variable<int>(esGeneral.value);
    }
    if (ignorarDemasBloqueos.present) {
      map['ignorar_demas_bloqueos'] = Variable<int>(ignorarDemasBloqueos.value);
    }
    if (idMoneda.present) {
      map['id_moneda'] = Variable<int>(idMoneda.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StocksCompanion(')
          ..write('id: $id, ')
          ..write('idBanca: $idBanca, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idLoteriaSuperpale: $idLoteriaSuperpale, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('jugada: $jugada, ')
          ..write('montoInicial: $montoInicial, ')
          ..write('monto: $monto, ')
          ..write('created_at: $created_at, ')
          ..write('esBloqueoJugada: $esBloqueoJugada, ')
          ..write('esGeneral: $esGeneral, ')
          ..write('ignorarDemasBloqueos: $ignorarDemasBloqueos, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }
}

class $StocksTable extends Stocks with TableInfo<$StocksTable, Stock> {
  final GeneratedDatabase _db;
  final String _alias;
  $StocksTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idBancaMeta = const VerificationMeta('idBanca');
  GeneratedIntColumn _idBanca;
  @override
  GeneratedIntColumn get idBanca => _idBanca ??= _constructIdBanca();
  GeneratedIntColumn _constructIdBanca() {
    return GeneratedIntColumn(
      'id_banca',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idLoteriaMeta = const VerificationMeta('idLoteria');
  GeneratedIntColumn _idLoteria;
  @override
  GeneratedIntColumn get idLoteria => _idLoteria ??= _constructIdLoteria();
  GeneratedIntColumn _constructIdLoteria() {
    return GeneratedIntColumn(
      'id_loteria',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idLoteriaSuperpaleMeta =
      const VerificationMeta('idLoteriaSuperpale');
  GeneratedIntColumn _idLoteriaSuperpale;
  @override
  GeneratedIntColumn get idLoteriaSuperpale =>
      _idLoteriaSuperpale ??= _constructIdLoteriaSuperpale();
  GeneratedIntColumn _constructIdLoteriaSuperpale() {
    return GeneratedIntColumn(
      'id_loteria_superpale',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idSorteoMeta = const VerificationMeta('idSorteo');
  GeneratedIntColumn _idSorteo;
  @override
  GeneratedIntColumn get idSorteo => _idSorteo ??= _constructIdSorteo();
  GeneratedIntColumn _constructIdSorteo() {
    return GeneratedIntColumn(
      'id_sorteo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _jugadaMeta = const VerificationMeta('jugada');
  GeneratedTextColumn _jugada;
  @override
  GeneratedTextColumn get jugada => _jugada ??= _constructJugada();
  GeneratedTextColumn _constructJugada() {
    return GeneratedTextColumn(
      'jugada',
      $tableName,
      false,
    );
  }

  final VerificationMeta _montoInicialMeta =
      const VerificationMeta('montoInicial');
  GeneratedRealColumn _montoInicial;
  @override
  GeneratedRealColumn get montoInicial =>
      _montoInicial ??= _constructMontoInicial();
  GeneratedRealColumn _constructMontoInicial() {
    return GeneratedRealColumn(
      'monto_inicial',
      $tableName,
      false,
    );
  }

  final VerificationMeta _montoMeta = const VerificationMeta('monto');
  GeneratedRealColumn _monto;
  @override
  GeneratedRealColumn get monto => _monto ??= _constructMonto();
  GeneratedRealColumn _constructMonto() {
    return GeneratedRealColumn(
      'monto',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _esBloqueoJugadaMeta =
      const VerificationMeta('esBloqueoJugada');
  GeneratedIntColumn _esBloqueoJugada;
  @override
  GeneratedIntColumn get esBloqueoJugada =>
      _esBloqueoJugada ??= _constructEsBloqueoJugada();
  GeneratedIntColumn _constructEsBloqueoJugada() {
    return GeneratedIntColumn(
      'es_bloqueo_jugada',
      $tableName,
      false,
    );
  }

  final VerificationMeta _esGeneralMeta = const VerificationMeta('esGeneral');
  GeneratedIntColumn _esGeneral;
  @override
  GeneratedIntColumn get esGeneral => _esGeneral ??= _constructEsGeneral();
  GeneratedIntColumn _constructEsGeneral() {
    return GeneratedIntColumn(
      'es_general',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ignorarDemasBloqueosMeta =
      const VerificationMeta('ignorarDemasBloqueos');
  GeneratedIntColumn _ignorarDemasBloqueos;
  @override
  GeneratedIntColumn get ignorarDemasBloqueos =>
      _ignorarDemasBloqueos ??= _constructIgnorarDemasBloqueos();
  GeneratedIntColumn _constructIgnorarDemasBloqueos() {
    return GeneratedIntColumn(
      'ignorar_demas_bloqueos',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMonedaMeta = const VerificationMeta('idMoneda');
  GeneratedIntColumn _idMoneda;
  @override
  GeneratedIntColumn get idMoneda => _idMoneda ??= _constructIdMoneda();
  GeneratedIntColumn _constructIdMoneda() {
    return GeneratedIntColumn(
      'id_moneda',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idBanca,
        idLoteria,
        idLoteriaSuperpale,
        idSorteo,
        jugada,
        montoInicial,
        monto,
        created_at,
        esBloqueoJugada,
        esGeneral,
        ignorarDemasBloqueos,
        idMoneda
      ];
  @override
  $StocksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'stocks';
  @override
  final String actualTableName = 'stocks';
  @override
  VerificationContext validateIntegrity(Insertable<Stock> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_banca')) {
      context.handle(_idBancaMeta,
          idBanca.isAcceptableOrUnknown(data['id_banca'], _idBancaMeta));
    } else if (isInserting) {
      context.missing(_idBancaMeta);
    }
    if (data.containsKey('id_loteria')) {
      context.handle(_idLoteriaMeta,
          idLoteria.isAcceptableOrUnknown(data['id_loteria'], _idLoteriaMeta));
    } else if (isInserting) {
      context.missing(_idLoteriaMeta);
    }
    if (data.containsKey('id_loteria_superpale')) {
      context.handle(
          _idLoteriaSuperpaleMeta,
          idLoteriaSuperpale.isAcceptableOrUnknown(
              data['id_loteria_superpale'], _idLoteriaSuperpaleMeta));
    } else if (isInserting) {
      context.missing(_idLoteriaSuperpaleMeta);
    }
    if (data.containsKey('id_sorteo')) {
      context.handle(_idSorteoMeta,
          idSorteo.isAcceptableOrUnknown(data['id_sorteo'], _idSorteoMeta));
    } else if (isInserting) {
      context.missing(_idSorteoMeta);
    }
    if (data.containsKey('jugada')) {
      context.handle(_jugadaMeta,
          jugada.isAcceptableOrUnknown(data['jugada'], _jugadaMeta));
    } else if (isInserting) {
      context.missing(_jugadaMeta);
    }
    if (data.containsKey('monto_inicial')) {
      context.handle(
          _montoInicialMeta,
          montoInicial.isAcceptableOrUnknown(
              data['monto_inicial'], _montoInicialMeta));
    } else if (isInserting) {
      context.missing(_montoInicialMeta);
    }
    if (data.containsKey('monto')) {
      context.handle(
          _montoMeta, monto.isAcceptableOrUnknown(data['monto'], _montoMeta));
    } else if (isInserting) {
      context.missing(_montoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('es_bloqueo_jugada')) {
      context.handle(
          _esBloqueoJugadaMeta,
          esBloqueoJugada.isAcceptableOrUnknown(
              data['es_bloqueo_jugada'], _esBloqueoJugadaMeta));
    } else if (isInserting) {
      context.missing(_esBloqueoJugadaMeta);
    }
    if (data.containsKey('es_general')) {
      context.handle(_esGeneralMeta,
          esGeneral.isAcceptableOrUnknown(data['es_general'], _esGeneralMeta));
    } else if (isInserting) {
      context.missing(_esGeneralMeta);
    }
    if (data.containsKey('ignorar_demas_bloqueos')) {
      context.handle(
          _ignorarDemasBloqueosMeta,
          ignorarDemasBloqueos.isAcceptableOrUnknown(
              data['ignorar_demas_bloqueos'], _ignorarDemasBloqueosMeta));
    } else if (isInserting) {
      context.missing(_ignorarDemasBloqueosMeta);
    }
    if (data.containsKey('id_moneda')) {
      context.handle(_idMonedaMeta,
          idMoneda.isAcceptableOrUnknown(data['id_moneda'], _idMonedaMeta));
    } else if (isInserting) {
      context.missing(_idMonedaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Stock map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Stock.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $StocksTable createAlias(String alias) {
    return $StocksTable(_db, alias);
  }
}

class Blocksgeneral extends DataClass implements Insertable<Blocksgeneral> {
  final int id;
  final int idDia;
  final int idLoteria;
  final int idSorteo;
  final double monto;
  final DateTime created_at;
  final int idMoneda;
  Blocksgeneral(
      {@required this.id,
      @required this.idDia,
      @required this.idLoteria,
      @required this.idSorteo,
      @required this.monto,
      this.created_at,
      @required this.idMoneda});
  factory Blocksgeneral.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Blocksgeneral(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idDia: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_dia']),
      idLoteria:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_loteria']),
      idSorteo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_sorteo']),
      monto:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}monto']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      idMoneda:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_moneda']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idDia != null) {
      map['id_dia'] = Variable<int>(idDia);
    }
    if (!nullToAbsent || idLoteria != null) {
      map['id_loteria'] = Variable<int>(idLoteria);
    }
    if (!nullToAbsent || idSorteo != null) {
      map['id_sorteo'] = Variable<int>(idSorteo);
    }
    if (!nullToAbsent || monto != null) {
      map['monto'] = Variable<double>(monto);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || idMoneda != null) {
      map['id_moneda'] = Variable<int>(idMoneda);
    }
    return map;
  }

  BlocksgeneralsCompanion toCompanion(bool nullToAbsent) {
    return BlocksgeneralsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idDia:
          idDia == null && nullToAbsent ? const Value.absent() : Value(idDia),
      idLoteria: idLoteria == null && nullToAbsent
          ? const Value.absent()
          : Value(idLoteria),
      idSorteo: idSorteo == null && nullToAbsent
          ? const Value.absent()
          : Value(idSorteo),
      monto:
          monto == null && nullToAbsent ? const Value.absent() : Value(monto),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      idMoneda: idMoneda == null && nullToAbsent
          ? const Value.absent()
          : Value(idMoneda),
    );
  }

  factory Blocksgeneral.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Blocksgeneral(
      id: serializer.fromJson<int>(json['id']),
      idDia: serializer.fromJson<int>(json['idDia']),
      idLoteria: serializer.fromJson<int>(json['idLoteria']),
      idSorteo: serializer.fromJson<int>(json['idSorteo']),
      monto: serializer.fromJson<double>(json['monto']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      idMoneda: serializer.fromJson<int>(json['idMoneda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idDia': serializer.toJson<int>(idDia),
      'idLoteria': serializer.toJson<int>(idLoteria),
      'idSorteo': serializer.toJson<int>(idSorteo),
      'monto': serializer.toJson<double>(monto),
      'created_at': serializer.toJson<DateTime>(created_at),
      'idMoneda': serializer.toJson<int>(idMoneda),
    };
  }

  Blocksgeneral copyWith(
          {int id,
          int idDia,
          int idLoteria,
          int idSorteo,
          double monto,
          DateTime created_at,
          int idMoneda}) =>
      Blocksgeneral(
        id: id ?? this.id,
        idDia: idDia ?? this.idDia,
        idLoteria: idLoteria ?? this.idLoteria,
        idSorteo: idSorteo ?? this.idSorteo,
        monto: monto ?? this.monto,
        created_at: created_at ?? this.created_at,
        idMoneda: idMoneda ?? this.idMoneda,
      );
  @override
  String toString() {
    return (StringBuffer('Blocksgeneral(')
          ..write('id: $id, ')
          ..write('idDia: $idDia, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('monto: $monto, ')
          ..write('created_at: $created_at, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idDia.hashCode,
          $mrjc(
              idLoteria.hashCode,
              $mrjc(
                  idSorteo.hashCode,
                  $mrjc(monto.hashCode,
                      $mrjc(created_at.hashCode, idMoneda.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Blocksgeneral &&
          other.id == this.id &&
          other.idDia == this.idDia &&
          other.idLoteria == this.idLoteria &&
          other.idSorteo == this.idSorteo &&
          other.monto == this.monto &&
          other.created_at == this.created_at &&
          other.idMoneda == this.idMoneda);
}

class BlocksgeneralsCompanion extends UpdateCompanion<Blocksgeneral> {
  final Value<int> id;
  final Value<int> idDia;
  final Value<int> idLoteria;
  final Value<int> idSorteo;
  final Value<double> monto;
  final Value<DateTime> created_at;
  final Value<int> idMoneda;
  const BlocksgeneralsCompanion({
    this.id = const Value.absent(),
    this.idDia = const Value.absent(),
    this.idLoteria = const Value.absent(),
    this.idSorteo = const Value.absent(),
    this.monto = const Value.absent(),
    this.created_at = const Value.absent(),
    this.idMoneda = const Value.absent(),
  });
  BlocksgeneralsCompanion.insert({
    this.id = const Value.absent(),
    @required int idDia,
    @required int idLoteria,
    @required int idSorteo,
    @required double monto,
    this.created_at = const Value.absent(),
    @required int idMoneda,
  })  : idDia = Value(idDia),
        idLoteria = Value(idLoteria),
        idSorteo = Value(idSorteo),
        monto = Value(monto),
        idMoneda = Value(idMoneda);
  static Insertable<Blocksgeneral> custom({
    Expression<int> id,
    Expression<int> idDia,
    Expression<int> idLoteria,
    Expression<int> idSorteo,
    Expression<double> monto,
    Expression<DateTime> created_at,
    Expression<int> idMoneda,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idDia != null) 'id_dia': idDia,
      if (idLoteria != null) 'id_loteria': idLoteria,
      if (idSorteo != null) 'id_sorteo': idSorteo,
      if (monto != null) 'monto': monto,
      if (created_at != null) 'created_at': created_at,
      if (idMoneda != null) 'id_moneda': idMoneda,
    });
  }

  BlocksgeneralsCompanion copyWith(
      {Value<int> id,
      Value<int> idDia,
      Value<int> idLoteria,
      Value<int> idSorteo,
      Value<double> monto,
      Value<DateTime> created_at,
      Value<int> idMoneda}) {
    return BlocksgeneralsCompanion(
      id: id ?? this.id,
      idDia: idDia ?? this.idDia,
      idLoteria: idLoteria ?? this.idLoteria,
      idSorteo: idSorteo ?? this.idSorteo,
      monto: monto ?? this.monto,
      created_at: created_at ?? this.created_at,
      idMoneda: idMoneda ?? this.idMoneda,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idDia.present) {
      map['id_dia'] = Variable<int>(idDia.value);
    }
    if (idLoteria.present) {
      map['id_loteria'] = Variable<int>(idLoteria.value);
    }
    if (idSorteo.present) {
      map['id_sorteo'] = Variable<int>(idSorteo.value);
    }
    if (monto.present) {
      map['monto'] = Variable<double>(monto.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (idMoneda.present) {
      map['id_moneda'] = Variable<int>(idMoneda.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlocksgeneralsCompanion(')
          ..write('id: $id, ')
          ..write('idDia: $idDia, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('monto: $monto, ')
          ..write('created_at: $created_at, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }
}

class $BlocksgeneralsTable extends Blocksgenerals
    with TableInfo<$BlocksgeneralsTable, Blocksgeneral> {
  final GeneratedDatabase _db;
  final String _alias;
  $BlocksgeneralsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idDiaMeta = const VerificationMeta('idDia');
  GeneratedIntColumn _idDia;
  @override
  GeneratedIntColumn get idDia => _idDia ??= _constructIdDia();
  GeneratedIntColumn _constructIdDia() {
    return GeneratedIntColumn(
      'id_dia',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idLoteriaMeta = const VerificationMeta('idLoteria');
  GeneratedIntColumn _idLoteria;
  @override
  GeneratedIntColumn get idLoteria => _idLoteria ??= _constructIdLoteria();
  GeneratedIntColumn _constructIdLoteria() {
    return GeneratedIntColumn(
      'id_loteria',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idSorteoMeta = const VerificationMeta('idSorteo');
  GeneratedIntColumn _idSorteo;
  @override
  GeneratedIntColumn get idSorteo => _idSorteo ??= _constructIdSorteo();
  GeneratedIntColumn _constructIdSorteo() {
    return GeneratedIntColumn(
      'id_sorteo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _montoMeta = const VerificationMeta('monto');
  GeneratedRealColumn _monto;
  @override
  GeneratedRealColumn get monto => _monto ??= _constructMonto();
  GeneratedRealColumn _constructMonto() {
    return GeneratedRealColumn(
      'monto',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMonedaMeta = const VerificationMeta('idMoneda');
  GeneratedIntColumn _idMoneda;
  @override
  GeneratedIntColumn get idMoneda => _idMoneda ??= _constructIdMoneda();
  GeneratedIntColumn _constructIdMoneda() {
    return GeneratedIntColumn(
      'id_moneda',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, idDia, idLoteria, idSorteo, monto, created_at, idMoneda];
  @override
  $BlocksgeneralsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'blocksgenerals';
  @override
  final String actualTableName = 'blocksgenerals';
  @override
  VerificationContext validateIntegrity(Insertable<Blocksgeneral> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_dia')) {
      context.handle(
          _idDiaMeta, idDia.isAcceptableOrUnknown(data['id_dia'], _idDiaMeta));
    } else if (isInserting) {
      context.missing(_idDiaMeta);
    }
    if (data.containsKey('id_loteria')) {
      context.handle(_idLoteriaMeta,
          idLoteria.isAcceptableOrUnknown(data['id_loteria'], _idLoteriaMeta));
    } else if (isInserting) {
      context.missing(_idLoteriaMeta);
    }
    if (data.containsKey('id_sorteo')) {
      context.handle(_idSorteoMeta,
          idSorteo.isAcceptableOrUnknown(data['id_sorteo'], _idSorteoMeta));
    } else if (isInserting) {
      context.missing(_idSorteoMeta);
    }
    if (data.containsKey('monto')) {
      context.handle(
          _montoMeta, monto.isAcceptableOrUnknown(data['monto'], _montoMeta));
    } else if (isInserting) {
      context.missing(_montoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('id_moneda')) {
      context.handle(_idMonedaMeta,
          idMoneda.isAcceptableOrUnknown(data['id_moneda'], _idMonedaMeta));
    } else if (isInserting) {
      context.missing(_idMonedaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Blocksgeneral map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Blocksgeneral.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BlocksgeneralsTable createAlias(String alias) {
    return $BlocksgeneralsTable(_db, alias);
  }
}

class Blockslotterie extends DataClass implements Insertable<Blockslotterie> {
  final int id;
  final int idBanca;
  final int idDia;
  final int idLoteria;
  final int idSorteo;
  final double monto;
  final DateTime created_at;
  final int idMoneda;
  Blockslotterie(
      {@required this.id,
      @required this.idBanca,
      @required this.idDia,
      @required this.idLoteria,
      @required this.idSorteo,
      @required this.monto,
      this.created_at,
      @required this.idMoneda});
  factory Blockslotterie.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Blockslotterie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idBanca:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_banca']),
      idDia: intType.mapFromDatabaseResponse(data['${effectivePrefix}id_dia']),
      idLoteria:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_loteria']),
      idSorteo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_sorteo']),
      monto:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}monto']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      idMoneda:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_moneda']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idBanca != null) {
      map['id_banca'] = Variable<int>(idBanca);
    }
    if (!nullToAbsent || idDia != null) {
      map['id_dia'] = Variable<int>(idDia);
    }
    if (!nullToAbsent || idLoteria != null) {
      map['id_loteria'] = Variable<int>(idLoteria);
    }
    if (!nullToAbsent || idSorteo != null) {
      map['id_sorteo'] = Variable<int>(idSorteo);
    }
    if (!nullToAbsent || monto != null) {
      map['monto'] = Variable<double>(monto);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || idMoneda != null) {
      map['id_moneda'] = Variable<int>(idMoneda);
    }
    return map;
  }

  BlockslotteriesCompanion toCompanion(bool nullToAbsent) {
    return BlockslotteriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idBanca: idBanca == null && nullToAbsent
          ? const Value.absent()
          : Value(idBanca),
      idDia:
          idDia == null && nullToAbsent ? const Value.absent() : Value(idDia),
      idLoteria: idLoteria == null && nullToAbsent
          ? const Value.absent()
          : Value(idLoteria),
      idSorteo: idSorteo == null && nullToAbsent
          ? const Value.absent()
          : Value(idSorteo),
      monto:
          monto == null && nullToAbsent ? const Value.absent() : Value(monto),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      idMoneda: idMoneda == null && nullToAbsent
          ? const Value.absent()
          : Value(idMoneda),
    );
  }

  factory Blockslotterie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Blockslotterie(
      id: serializer.fromJson<int>(json['id']),
      idBanca: serializer.fromJson<int>(json['idBanca']),
      idDia: serializer.fromJson<int>(json['idDia']),
      idLoteria: serializer.fromJson<int>(json['idLoteria']),
      idSorteo: serializer.fromJson<int>(json['idSorteo']),
      monto: serializer.fromJson<double>(json['monto']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      idMoneda: serializer.fromJson<int>(json['idMoneda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idBanca': serializer.toJson<int>(idBanca),
      'idDia': serializer.toJson<int>(idDia),
      'idLoteria': serializer.toJson<int>(idLoteria),
      'idSorteo': serializer.toJson<int>(idSorteo),
      'monto': serializer.toJson<double>(monto),
      'created_at': serializer.toJson<DateTime>(created_at),
      'idMoneda': serializer.toJson<int>(idMoneda),
    };
  }

  Blockslotterie copyWith(
          {int id,
          int idBanca,
          int idDia,
          int idLoteria,
          int idSorteo,
          double monto,
          DateTime created_at,
          int idMoneda}) =>
      Blockslotterie(
        id: id ?? this.id,
        idBanca: idBanca ?? this.idBanca,
        idDia: idDia ?? this.idDia,
        idLoteria: idLoteria ?? this.idLoteria,
        idSorteo: idSorteo ?? this.idSorteo,
        monto: monto ?? this.monto,
        created_at: created_at ?? this.created_at,
        idMoneda: idMoneda ?? this.idMoneda,
      );
  @override
  String toString() {
    return (StringBuffer('Blockslotterie(')
          ..write('id: $id, ')
          ..write('idBanca: $idBanca, ')
          ..write('idDia: $idDia, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('monto: $monto, ')
          ..write('created_at: $created_at, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idBanca.hashCode,
          $mrjc(
              idDia.hashCode,
              $mrjc(
                  idLoteria.hashCode,
                  $mrjc(
                      idSorteo.hashCode,
                      $mrjc(monto.hashCode,
                          $mrjc(created_at.hashCode, idMoneda.hashCode))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Blockslotterie &&
          other.id == this.id &&
          other.idBanca == this.idBanca &&
          other.idDia == this.idDia &&
          other.idLoteria == this.idLoteria &&
          other.idSorteo == this.idSorteo &&
          other.monto == this.monto &&
          other.created_at == this.created_at &&
          other.idMoneda == this.idMoneda);
}

class BlockslotteriesCompanion extends UpdateCompanion<Blockslotterie> {
  final Value<int> id;
  final Value<int> idBanca;
  final Value<int> idDia;
  final Value<int> idLoteria;
  final Value<int> idSorteo;
  final Value<double> monto;
  final Value<DateTime> created_at;
  final Value<int> idMoneda;
  const BlockslotteriesCompanion({
    this.id = const Value.absent(),
    this.idBanca = const Value.absent(),
    this.idDia = const Value.absent(),
    this.idLoteria = const Value.absent(),
    this.idSorteo = const Value.absent(),
    this.monto = const Value.absent(),
    this.created_at = const Value.absent(),
    this.idMoneda = const Value.absent(),
  });
  BlockslotteriesCompanion.insert({
    this.id = const Value.absent(),
    @required int idBanca,
    @required int idDia,
    @required int idLoteria,
    @required int idSorteo,
    @required double monto,
    this.created_at = const Value.absent(),
    @required int idMoneda,
  })  : idBanca = Value(idBanca),
        idDia = Value(idDia),
        idLoteria = Value(idLoteria),
        idSorteo = Value(idSorteo),
        monto = Value(monto),
        idMoneda = Value(idMoneda);
  static Insertable<Blockslotterie> custom({
    Expression<int> id,
    Expression<int> idBanca,
    Expression<int> idDia,
    Expression<int> idLoteria,
    Expression<int> idSorteo,
    Expression<double> monto,
    Expression<DateTime> created_at,
    Expression<int> idMoneda,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idBanca != null) 'id_banca': idBanca,
      if (idDia != null) 'id_dia': idDia,
      if (idLoteria != null) 'id_loteria': idLoteria,
      if (idSorteo != null) 'id_sorteo': idSorteo,
      if (monto != null) 'monto': monto,
      if (created_at != null) 'created_at': created_at,
      if (idMoneda != null) 'id_moneda': idMoneda,
    });
  }

  BlockslotteriesCompanion copyWith(
      {Value<int> id,
      Value<int> idBanca,
      Value<int> idDia,
      Value<int> idLoteria,
      Value<int> idSorteo,
      Value<double> monto,
      Value<DateTime> created_at,
      Value<int> idMoneda}) {
    return BlockslotteriesCompanion(
      id: id ?? this.id,
      idBanca: idBanca ?? this.idBanca,
      idDia: idDia ?? this.idDia,
      idLoteria: idLoteria ?? this.idLoteria,
      idSorteo: idSorteo ?? this.idSorteo,
      monto: monto ?? this.monto,
      created_at: created_at ?? this.created_at,
      idMoneda: idMoneda ?? this.idMoneda,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idBanca.present) {
      map['id_banca'] = Variable<int>(idBanca.value);
    }
    if (idDia.present) {
      map['id_dia'] = Variable<int>(idDia.value);
    }
    if (idLoteria.present) {
      map['id_loteria'] = Variable<int>(idLoteria.value);
    }
    if (idSorteo.present) {
      map['id_sorteo'] = Variable<int>(idSorteo.value);
    }
    if (monto.present) {
      map['monto'] = Variable<double>(monto.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (idMoneda.present) {
      map['id_moneda'] = Variable<int>(idMoneda.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlockslotteriesCompanion(')
          ..write('id: $id, ')
          ..write('idBanca: $idBanca, ')
          ..write('idDia: $idDia, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('monto: $monto, ')
          ..write('created_at: $created_at, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }
}

class $BlockslotteriesTable extends Blockslotteries
    with TableInfo<$BlockslotteriesTable, Blockslotterie> {
  final GeneratedDatabase _db;
  final String _alias;
  $BlockslotteriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idBancaMeta = const VerificationMeta('idBanca');
  GeneratedIntColumn _idBanca;
  @override
  GeneratedIntColumn get idBanca => _idBanca ??= _constructIdBanca();
  GeneratedIntColumn _constructIdBanca() {
    return GeneratedIntColumn(
      'id_banca',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idDiaMeta = const VerificationMeta('idDia');
  GeneratedIntColumn _idDia;
  @override
  GeneratedIntColumn get idDia => _idDia ??= _constructIdDia();
  GeneratedIntColumn _constructIdDia() {
    return GeneratedIntColumn(
      'id_dia',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idLoteriaMeta = const VerificationMeta('idLoteria');
  GeneratedIntColumn _idLoteria;
  @override
  GeneratedIntColumn get idLoteria => _idLoteria ??= _constructIdLoteria();
  GeneratedIntColumn _constructIdLoteria() {
    return GeneratedIntColumn(
      'id_loteria',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idSorteoMeta = const VerificationMeta('idSorteo');
  GeneratedIntColumn _idSorteo;
  @override
  GeneratedIntColumn get idSorteo => _idSorteo ??= _constructIdSorteo();
  GeneratedIntColumn _constructIdSorteo() {
    return GeneratedIntColumn(
      'id_sorteo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _montoMeta = const VerificationMeta('monto');
  GeneratedRealColumn _monto;
  @override
  GeneratedRealColumn get monto => _monto ??= _constructMonto();
  GeneratedRealColumn _constructMonto() {
    return GeneratedRealColumn(
      'monto',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMonedaMeta = const VerificationMeta('idMoneda');
  GeneratedIntColumn _idMoneda;
  @override
  GeneratedIntColumn get idMoneda => _idMoneda ??= _constructIdMoneda();
  GeneratedIntColumn _constructIdMoneda() {
    return GeneratedIntColumn(
      'id_moneda',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, idBanca, idDia, idLoteria, idSorteo, monto, created_at, idMoneda];
  @override
  $BlockslotteriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'blockslotteries';
  @override
  final String actualTableName = 'blockslotteries';
  @override
  VerificationContext validateIntegrity(Insertable<Blockslotterie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_banca')) {
      context.handle(_idBancaMeta,
          idBanca.isAcceptableOrUnknown(data['id_banca'], _idBancaMeta));
    } else if (isInserting) {
      context.missing(_idBancaMeta);
    }
    if (data.containsKey('id_dia')) {
      context.handle(
          _idDiaMeta, idDia.isAcceptableOrUnknown(data['id_dia'], _idDiaMeta));
    } else if (isInserting) {
      context.missing(_idDiaMeta);
    }
    if (data.containsKey('id_loteria')) {
      context.handle(_idLoteriaMeta,
          idLoteria.isAcceptableOrUnknown(data['id_loteria'], _idLoteriaMeta));
    } else if (isInserting) {
      context.missing(_idLoteriaMeta);
    }
    if (data.containsKey('id_sorteo')) {
      context.handle(_idSorteoMeta,
          idSorteo.isAcceptableOrUnknown(data['id_sorteo'], _idSorteoMeta));
    } else if (isInserting) {
      context.missing(_idSorteoMeta);
    }
    if (data.containsKey('monto')) {
      context.handle(
          _montoMeta, monto.isAcceptableOrUnknown(data['monto'], _montoMeta));
    } else if (isInserting) {
      context.missing(_montoMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('id_moneda')) {
      context.handle(_idMonedaMeta,
          idMoneda.isAcceptableOrUnknown(data['id_moneda'], _idMonedaMeta));
    } else if (isInserting) {
      context.missing(_idMonedaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Blockslotterie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Blockslotterie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BlockslotteriesTable createAlias(String alias) {
    return $BlockslotteriesTable(_db, alias);
  }
}

class Blocksplay extends DataClass implements Insertable<Blocksplay> {
  final int id;
  final int idBanca;
  final int idLoteria;
  final int idSorteo;
  final String jugada;
  final double monto;
  final double montoInicial;
  final DateTime created_at;
  final DateTime fechaDesde;
  final DateTime fechaHasta;
  final int ignorarDemasBloqueos;
  final int status;
  final int idMoneda;
  Blocksplay(
      {@required this.id,
      @required this.idBanca,
      @required this.idLoteria,
      @required this.idSorteo,
      @required this.jugada,
      @required this.monto,
      @required this.montoInicial,
      this.created_at,
      this.fechaDesde,
      this.fechaHasta,
      @required this.ignorarDemasBloqueos,
      @required this.status,
      @required this.idMoneda});
  factory Blocksplay.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Blocksplay(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idBanca:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_banca']),
      idLoteria:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_loteria']),
      idSorteo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_sorteo']),
      jugada:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}jugada']),
      monto:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}monto']),
      montoInicial: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}monto_inicial']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      fechaDesde: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_desde']),
      fechaHasta: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_hasta']),
      ignorarDemasBloqueos: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}ignorar_demas_bloqueos']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      idMoneda:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_moneda']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idBanca != null) {
      map['id_banca'] = Variable<int>(idBanca);
    }
    if (!nullToAbsent || idLoteria != null) {
      map['id_loteria'] = Variable<int>(idLoteria);
    }
    if (!nullToAbsent || idSorteo != null) {
      map['id_sorteo'] = Variable<int>(idSorteo);
    }
    if (!nullToAbsent || jugada != null) {
      map['jugada'] = Variable<String>(jugada);
    }
    if (!nullToAbsent || monto != null) {
      map['monto'] = Variable<double>(monto);
    }
    if (!nullToAbsent || montoInicial != null) {
      map['monto_inicial'] = Variable<double>(montoInicial);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || fechaDesde != null) {
      map['fecha_desde'] = Variable<DateTime>(fechaDesde);
    }
    if (!nullToAbsent || fechaHasta != null) {
      map['fecha_hasta'] = Variable<DateTime>(fechaHasta);
    }
    if (!nullToAbsent || ignorarDemasBloqueos != null) {
      map['ignorar_demas_bloqueos'] = Variable<int>(ignorarDemasBloqueos);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || idMoneda != null) {
      map['id_moneda'] = Variable<int>(idMoneda);
    }
    return map;
  }

  BlocksplaysCompanion toCompanion(bool nullToAbsent) {
    return BlocksplaysCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idBanca: idBanca == null && nullToAbsent
          ? const Value.absent()
          : Value(idBanca),
      idLoteria: idLoteria == null && nullToAbsent
          ? const Value.absent()
          : Value(idLoteria),
      idSorteo: idSorteo == null && nullToAbsent
          ? const Value.absent()
          : Value(idSorteo),
      jugada:
          jugada == null && nullToAbsent ? const Value.absent() : Value(jugada),
      monto:
          monto == null && nullToAbsent ? const Value.absent() : Value(monto),
      montoInicial: montoInicial == null && nullToAbsent
          ? const Value.absent()
          : Value(montoInicial),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      fechaDesde: fechaDesde == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaDesde),
      fechaHasta: fechaHasta == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaHasta),
      ignorarDemasBloqueos: ignorarDemasBloqueos == null && nullToAbsent
          ? const Value.absent()
          : Value(ignorarDemasBloqueos),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      idMoneda: idMoneda == null && nullToAbsent
          ? const Value.absent()
          : Value(idMoneda),
    );
  }

  factory Blocksplay.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Blocksplay(
      id: serializer.fromJson<int>(json['id']),
      idBanca: serializer.fromJson<int>(json['idBanca']),
      idLoteria: serializer.fromJson<int>(json['idLoteria']),
      idSorteo: serializer.fromJson<int>(json['idSorteo']),
      jugada: serializer.fromJson<String>(json['jugada']),
      monto: serializer.fromJson<double>(json['monto']),
      montoInicial: serializer.fromJson<double>(json['montoInicial']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      fechaDesde: serializer.fromJson<DateTime>(json['fechaDesde']),
      fechaHasta: serializer.fromJson<DateTime>(json['fechaHasta']),
      ignorarDemasBloqueos:
          serializer.fromJson<int>(json['ignorarDemasBloqueos']),
      status: serializer.fromJson<int>(json['status']),
      idMoneda: serializer.fromJson<int>(json['idMoneda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idBanca': serializer.toJson<int>(idBanca),
      'idLoteria': serializer.toJson<int>(idLoteria),
      'idSorteo': serializer.toJson<int>(idSorteo),
      'jugada': serializer.toJson<String>(jugada),
      'monto': serializer.toJson<double>(monto),
      'montoInicial': serializer.toJson<double>(montoInicial),
      'created_at': serializer.toJson<DateTime>(created_at),
      'fechaDesde': serializer.toJson<DateTime>(fechaDesde),
      'fechaHasta': serializer.toJson<DateTime>(fechaHasta),
      'ignorarDemasBloqueos': serializer.toJson<int>(ignorarDemasBloqueos),
      'status': serializer.toJson<int>(status),
      'idMoneda': serializer.toJson<int>(idMoneda),
    };
  }

  Blocksplay copyWith(
          {int id,
          int idBanca,
          int idLoteria,
          int idSorteo,
          String jugada,
          double monto,
          double montoInicial,
          DateTime created_at,
          DateTime fechaDesde,
          DateTime fechaHasta,
          int ignorarDemasBloqueos,
          int status,
          int idMoneda}) =>
      Blocksplay(
        id: id ?? this.id,
        idBanca: idBanca ?? this.idBanca,
        idLoteria: idLoteria ?? this.idLoteria,
        idSorteo: idSorteo ?? this.idSorteo,
        jugada: jugada ?? this.jugada,
        monto: monto ?? this.monto,
        montoInicial: montoInicial ?? this.montoInicial,
        created_at: created_at ?? this.created_at,
        fechaDesde: fechaDesde ?? this.fechaDesde,
        fechaHasta: fechaHasta ?? this.fechaHasta,
        ignorarDemasBloqueos: ignorarDemasBloqueos ?? this.ignorarDemasBloqueos,
        status: status ?? this.status,
        idMoneda: idMoneda ?? this.idMoneda,
      );
  @override
  String toString() {
    return (StringBuffer('Blocksplay(')
          ..write('id: $id, ')
          ..write('idBanca: $idBanca, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('jugada: $jugada, ')
          ..write('monto: $monto, ')
          ..write('montoInicial: $montoInicial, ')
          ..write('created_at: $created_at, ')
          ..write('fechaDesde: $fechaDesde, ')
          ..write('fechaHasta: $fechaHasta, ')
          ..write('ignorarDemasBloqueos: $ignorarDemasBloqueos, ')
          ..write('status: $status, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idBanca.hashCode,
          $mrjc(
              idLoteria.hashCode,
              $mrjc(
                  idSorteo.hashCode,
                  $mrjc(
                      jugada.hashCode,
                      $mrjc(
                          monto.hashCode,
                          $mrjc(
                              montoInicial.hashCode,
                              $mrjc(
                                  created_at.hashCode,
                                  $mrjc(
                                      fechaDesde.hashCode,
                                      $mrjc(
                                          fechaHasta.hashCode,
                                          $mrjc(
                                              ignorarDemasBloqueos.hashCode,
                                              $mrjc(
                                                  status.hashCode,
                                                  idMoneda
                                                      .hashCode)))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Blocksplay &&
          other.id == this.id &&
          other.idBanca == this.idBanca &&
          other.idLoteria == this.idLoteria &&
          other.idSorteo == this.idSorteo &&
          other.jugada == this.jugada &&
          other.monto == this.monto &&
          other.montoInicial == this.montoInicial &&
          other.created_at == this.created_at &&
          other.fechaDesde == this.fechaDesde &&
          other.fechaHasta == this.fechaHasta &&
          other.ignorarDemasBloqueos == this.ignorarDemasBloqueos &&
          other.status == this.status &&
          other.idMoneda == this.idMoneda);
}

class BlocksplaysCompanion extends UpdateCompanion<Blocksplay> {
  final Value<int> id;
  final Value<int> idBanca;
  final Value<int> idLoteria;
  final Value<int> idSorteo;
  final Value<String> jugada;
  final Value<double> monto;
  final Value<double> montoInicial;
  final Value<DateTime> created_at;
  final Value<DateTime> fechaDesde;
  final Value<DateTime> fechaHasta;
  final Value<int> ignorarDemasBloqueos;
  final Value<int> status;
  final Value<int> idMoneda;
  const BlocksplaysCompanion({
    this.id = const Value.absent(),
    this.idBanca = const Value.absent(),
    this.idLoteria = const Value.absent(),
    this.idSorteo = const Value.absent(),
    this.jugada = const Value.absent(),
    this.monto = const Value.absent(),
    this.montoInicial = const Value.absent(),
    this.created_at = const Value.absent(),
    this.fechaDesde = const Value.absent(),
    this.fechaHasta = const Value.absent(),
    this.ignorarDemasBloqueos = const Value.absent(),
    this.status = const Value.absent(),
    this.idMoneda = const Value.absent(),
  });
  BlocksplaysCompanion.insert({
    this.id = const Value.absent(),
    @required int idBanca,
    @required int idLoteria,
    @required int idSorteo,
    @required String jugada,
    @required double monto,
    @required double montoInicial,
    this.created_at = const Value.absent(),
    this.fechaDesde = const Value.absent(),
    this.fechaHasta = const Value.absent(),
    @required int ignorarDemasBloqueos,
    @required int status,
    @required int idMoneda,
  })  : idBanca = Value(idBanca),
        idLoteria = Value(idLoteria),
        idSorteo = Value(idSorteo),
        jugada = Value(jugada),
        monto = Value(monto),
        montoInicial = Value(montoInicial),
        ignorarDemasBloqueos = Value(ignorarDemasBloqueos),
        status = Value(status),
        idMoneda = Value(idMoneda);
  static Insertable<Blocksplay> custom({
    Expression<int> id,
    Expression<int> idBanca,
    Expression<int> idLoteria,
    Expression<int> idSorteo,
    Expression<String> jugada,
    Expression<double> monto,
    Expression<double> montoInicial,
    Expression<DateTime> created_at,
    Expression<DateTime> fechaDesde,
    Expression<DateTime> fechaHasta,
    Expression<int> ignorarDemasBloqueos,
    Expression<int> status,
    Expression<int> idMoneda,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idBanca != null) 'id_banca': idBanca,
      if (idLoteria != null) 'id_loteria': idLoteria,
      if (idSorteo != null) 'id_sorteo': idSorteo,
      if (jugada != null) 'jugada': jugada,
      if (monto != null) 'monto': monto,
      if (montoInicial != null) 'monto_inicial': montoInicial,
      if (created_at != null) 'created_at': created_at,
      if (fechaDesde != null) 'fecha_desde': fechaDesde,
      if (fechaHasta != null) 'fecha_hasta': fechaHasta,
      if (ignorarDemasBloqueos != null)
        'ignorar_demas_bloqueos': ignorarDemasBloqueos,
      if (status != null) 'status': status,
      if (idMoneda != null) 'id_moneda': idMoneda,
    });
  }

  BlocksplaysCompanion copyWith(
      {Value<int> id,
      Value<int> idBanca,
      Value<int> idLoteria,
      Value<int> idSorteo,
      Value<String> jugada,
      Value<double> monto,
      Value<double> montoInicial,
      Value<DateTime> created_at,
      Value<DateTime> fechaDesde,
      Value<DateTime> fechaHasta,
      Value<int> ignorarDemasBloqueos,
      Value<int> status,
      Value<int> idMoneda}) {
    return BlocksplaysCompanion(
      id: id ?? this.id,
      idBanca: idBanca ?? this.idBanca,
      idLoteria: idLoteria ?? this.idLoteria,
      idSorteo: idSorteo ?? this.idSorteo,
      jugada: jugada ?? this.jugada,
      monto: monto ?? this.monto,
      montoInicial: montoInicial ?? this.montoInicial,
      created_at: created_at ?? this.created_at,
      fechaDesde: fechaDesde ?? this.fechaDesde,
      fechaHasta: fechaHasta ?? this.fechaHasta,
      ignorarDemasBloqueos: ignorarDemasBloqueos ?? this.ignorarDemasBloqueos,
      status: status ?? this.status,
      idMoneda: idMoneda ?? this.idMoneda,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idBanca.present) {
      map['id_banca'] = Variable<int>(idBanca.value);
    }
    if (idLoteria.present) {
      map['id_loteria'] = Variable<int>(idLoteria.value);
    }
    if (idSorteo.present) {
      map['id_sorteo'] = Variable<int>(idSorteo.value);
    }
    if (jugada.present) {
      map['jugada'] = Variable<String>(jugada.value);
    }
    if (monto.present) {
      map['monto'] = Variable<double>(monto.value);
    }
    if (montoInicial.present) {
      map['monto_inicial'] = Variable<double>(montoInicial.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (fechaDesde.present) {
      map['fecha_desde'] = Variable<DateTime>(fechaDesde.value);
    }
    if (fechaHasta.present) {
      map['fecha_hasta'] = Variable<DateTime>(fechaHasta.value);
    }
    if (ignorarDemasBloqueos.present) {
      map['ignorar_demas_bloqueos'] = Variable<int>(ignorarDemasBloqueos.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (idMoneda.present) {
      map['id_moneda'] = Variable<int>(idMoneda.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlocksplaysCompanion(')
          ..write('id: $id, ')
          ..write('idBanca: $idBanca, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('jugada: $jugada, ')
          ..write('monto: $monto, ')
          ..write('montoInicial: $montoInicial, ')
          ..write('created_at: $created_at, ')
          ..write('fechaDesde: $fechaDesde, ')
          ..write('fechaHasta: $fechaHasta, ')
          ..write('ignorarDemasBloqueos: $ignorarDemasBloqueos, ')
          ..write('status: $status, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }
}

class $BlocksplaysTable extends Blocksplays
    with TableInfo<$BlocksplaysTable, Blocksplay> {
  final GeneratedDatabase _db;
  final String _alias;
  $BlocksplaysTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idBancaMeta = const VerificationMeta('idBanca');
  GeneratedIntColumn _idBanca;
  @override
  GeneratedIntColumn get idBanca => _idBanca ??= _constructIdBanca();
  GeneratedIntColumn _constructIdBanca() {
    return GeneratedIntColumn(
      'id_banca',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idLoteriaMeta = const VerificationMeta('idLoteria');
  GeneratedIntColumn _idLoteria;
  @override
  GeneratedIntColumn get idLoteria => _idLoteria ??= _constructIdLoteria();
  GeneratedIntColumn _constructIdLoteria() {
    return GeneratedIntColumn(
      'id_loteria',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idSorteoMeta = const VerificationMeta('idSorteo');
  GeneratedIntColumn _idSorteo;
  @override
  GeneratedIntColumn get idSorteo => _idSorteo ??= _constructIdSorteo();
  GeneratedIntColumn _constructIdSorteo() {
    return GeneratedIntColumn(
      'id_sorteo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _jugadaMeta = const VerificationMeta('jugada');
  GeneratedTextColumn _jugada;
  @override
  GeneratedTextColumn get jugada => _jugada ??= _constructJugada();
  GeneratedTextColumn _constructJugada() {
    return GeneratedTextColumn(
      'jugada',
      $tableName,
      false,
    );
  }

  final VerificationMeta _montoMeta = const VerificationMeta('monto');
  GeneratedRealColumn _monto;
  @override
  GeneratedRealColumn get monto => _monto ??= _constructMonto();
  GeneratedRealColumn _constructMonto() {
    return GeneratedRealColumn(
      'monto',
      $tableName,
      false,
    );
  }

  final VerificationMeta _montoInicialMeta =
      const VerificationMeta('montoInicial');
  GeneratedRealColumn _montoInicial;
  @override
  GeneratedRealColumn get montoInicial =>
      _montoInicial ??= _constructMontoInicial();
  GeneratedRealColumn _constructMontoInicial() {
    return GeneratedRealColumn(
      'monto_inicial',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fechaDesdeMeta = const VerificationMeta('fechaDesde');
  GeneratedDateTimeColumn _fechaDesde;
  @override
  GeneratedDateTimeColumn get fechaDesde =>
      _fechaDesde ??= _constructFechaDesde();
  GeneratedDateTimeColumn _constructFechaDesde() {
    return GeneratedDateTimeColumn(
      'fecha_desde',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fechaHastaMeta = const VerificationMeta('fechaHasta');
  GeneratedDateTimeColumn _fechaHasta;
  @override
  GeneratedDateTimeColumn get fechaHasta =>
      _fechaHasta ??= _constructFechaHasta();
  GeneratedDateTimeColumn _constructFechaHasta() {
    return GeneratedDateTimeColumn(
      'fecha_hasta',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ignorarDemasBloqueosMeta =
      const VerificationMeta('ignorarDemasBloqueos');
  GeneratedIntColumn _ignorarDemasBloqueos;
  @override
  GeneratedIntColumn get ignorarDemasBloqueos =>
      _ignorarDemasBloqueos ??= _constructIgnorarDemasBloqueos();
  GeneratedIntColumn _constructIgnorarDemasBloqueos() {
    return GeneratedIntColumn(
      'ignorar_demas_bloqueos',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMonedaMeta = const VerificationMeta('idMoneda');
  GeneratedIntColumn _idMoneda;
  @override
  GeneratedIntColumn get idMoneda => _idMoneda ??= _constructIdMoneda();
  GeneratedIntColumn _constructIdMoneda() {
    return GeneratedIntColumn(
      'id_moneda',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idBanca,
        idLoteria,
        idSorteo,
        jugada,
        monto,
        montoInicial,
        created_at,
        fechaDesde,
        fechaHasta,
        ignorarDemasBloqueos,
        status,
        idMoneda
      ];
  @override
  $BlocksplaysTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'blocksplays';
  @override
  final String actualTableName = 'blocksplays';
  @override
  VerificationContext validateIntegrity(Insertable<Blocksplay> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_banca')) {
      context.handle(_idBancaMeta,
          idBanca.isAcceptableOrUnknown(data['id_banca'], _idBancaMeta));
    } else if (isInserting) {
      context.missing(_idBancaMeta);
    }
    if (data.containsKey('id_loteria')) {
      context.handle(_idLoteriaMeta,
          idLoteria.isAcceptableOrUnknown(data['id_loteria'], _idLoteriaMeta));
    } else if (isInserting) {
      context.missing(_idLoteriaMeta);
    }
    if (data.containsKey('id_sorteo')) {
      context.handle(_idSorteoMeta,
          idSorteo.isAcceptableOrUnknown(data['id_sorteo'], _idSorteoMeta));
    } else if (isInserting) {
      context.missing(_idSorteoMeta);
    }
    if (data.containsKey('jugada')) {
      context.handle(_jugadaMeta,
          jugada.isAcceptableOrUnknown(data['jugada'], _jugadaMeta));
    } else if (isInserting) {
      context.missing(_jugadaMeta);
    }
    if (data.containsKey('monto')) {
      context.handle(
          _montoMeta, monto.isAcceptableOrUnknown(data['monto'], _montoMeta));
    } else if (isInserting) {
      context.missing(_montoMeta);
    }
    if (data.containsKey('monto_inicial')) {
      context.handle(
          _montoInicialMeta,
          montoInicial.isAcceptableOrUnknown(
              data['monto_inicial'], _montoInicialMeta));
    } else if (isInserting) {
      context.missing(_montoInicialMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('fecha_desde')) {
      context.handle(
          _fechaDesdeMeta,
          fechaDesde.isAcceptableOrUnknown(
              data['fecha_desde'], _fechaDesdeMeta));
    }
    if (data.containsKey('fecha_hasta')) {
      context.handle(
          _fechaHastaMeta,
          fechaHasta.isAcceptableOrUnknown(
              data['fecha_hasta'], _fechaHastaMeta));
    }
    if (data.containsKey('ignorar_demas_bloqueos')) {
      context.handle(
          _ignorarDemasBloqueosMeta,
          ignorarDemasBloqueos.isAcceptableOrUnknown(
              data['ignorar_demas_bloqueos'], _ignorarDemasBloqueosMeta));
    } else if (isInserting) {
      context.missing(_ignorarDemasBloqueosMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('id_moneda')) {
      context.handle(_idMonedaMeta,
          idMoneda.isAcceptableOrUnknown(data['id_moneda'], _idMonedaMeta));
    } else if (isInserting) {
      context.missing(_idMonedaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Blocksplay map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Blocksplay.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BlocksplaysTable createAlias(String alias) {
    return $BlocksplaysTable(_db, alias);
  }
}

class Blocksplaysgeneral extends DataClass
    implements Insertable<Blocksplaysgeneral> {
  final int id;
  final int idLoteria;
  final int idSorteo;
  final String jugada;
  final double monto;
  final double montoInicial;
  final DateTime created_at;
  final DateTime fechaDesde;
  final DateTime fechaHasta;
  final int ignorarDemasBloqueos;
  final int status;
  final int idMoneda;
  Blocksplaysgeneral(
      {@required this.id,
      @required this.idLoteria,
      @required this.idSorteo,
      @required this.jugada,
      @required this.monto,
      @required this.montoInicial,
      this.created_at,
      this.fechaDesde,
      this.fechaHasta,
      @required this.ignorarDemasBloqueos,
      @required this.status,
      @required this.idMoneda});
  factory Blocksplaysgeneral.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Blocksplaysgeneral(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idLoteria:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_loteria']),
      idSorteo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_sorteo']),
      jugada:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}jugada']),
      monto:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}monto']),
      montoInicial: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}monto_inicial']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      fechaDesde: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_desde']),
      fechaHasta: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_hasta']),
      ignorarDemasBloqueos: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}ignorar_demas_bloqueos']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
      idMoneda:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_moneda']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idLoteria != null) {
      map['id_loteria'] = Variable<int>(idLoteria);
    }
    if (!nullToAbsent || idSorteo != null) {
      map['id_sorteo'] = Variable<int>(idSorteo);
    }
    if (!nullToAbsent || jugada != null) {
      map['jugada'] = Variable<String>(jugada);
    }
    if (!nullToAbsent || monto != null) {
      map['monto'] = Variable<double>(monto);
    }
    if (!nullToAbsent || montoInicial != null) {
      map['monto_inicial'] = Variable<double>(montoInicial);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || fechaDesde != null) {
      map['fecha_desde'] = Variable<DateTime>(fechaDesde);
    }
    if (!nullToAbsent || fechaHasta != null) {
      map['fecha_hasta'] = Variable<DateTime>(fechaHasta);
    }
    if (!nullToAbsent || ignorarDemasBloqueos != null) {
      map['ignorar_demas_bloqueos'] = Variable<int>(ignorarDemasBloqueos);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    if (!nullToAbsent || idMoneda != null) {
      map['id_moneda'] = Variable<int>(idMoneda);
    }
    return map;
  }

  BlocksplaysgeneralsCompanion toCompanion(bool nullToAbsent) {
    return BlocksplaysgeneralsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idLoteria: idLoteria == null && nullToAbsent
          ? const Value.absent()
          : Value(idLoteria),
      idSorteo: idSorteo == null && nullToAbsent
          ? const Value.absent()
          : Value(idSorteo),
      jugada:
          jugada == null && nullToAbsent ? const Value.absent() : Value(jugada),
      monto:
          monto == null && nullToAbsent ? const Value.absent() : Value(monto),
      montoInicial: montoInicial == null && nullToAbsent
          ? const Value.absent()
          : Value(montoInicial),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      fechaDesde: fechaDesde == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaDesde),
      fechaHasta: fechaHasta == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaHasta),
      ignorarDemasBloqueos: ignorarDemasBloqueos == null && nullToAbsent
          ? const Value.absent()
          : Value(ignorarDemasBloqueos),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      idMoneda: idMoneda == null && nullToAbsent
          ? const Value.absent()
          : Value(idMoneda),
    );
  }

  factory Blocksplaysgeneral.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Blocksplaysgeneral(
      id: serializer.fromJson<int>(json['id']),
      idLoteria: serializer.fromJson<int>(json['idLoteria']),
      idSorteo: serializer.fromJson<int>(json['idSorteo']),
      jugada: serializer.fromJson<String>(json['jugada']),
      monto: serializer.fromJson<double>(json['monto']),
      montoInicial: serializer.fromJson<double>(json['montoInicial']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      fechaDesde: serializer.fromJson<DateTime>(json['fechaDesde']),
      fechaHasta: serializer.fromJson<DateTime>(json['fechaHasta']),
      ignorarDemasBloqueos:
          serializer.fromJson<int>(json['ignorarDemasBloqueos']),
      status: serializer.fromJson<int>(json['status']),
      idMoneda: serializer.fromJson<int>(json['idMoneda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idLoteria': serializer.toJson<int>(idLoteria),
      'idSorteo': serializer.toJson<int>(idSorteo),
      'jugada': serializer.toJson<String>(jugada),
      'monto': serializer.toJson<double>(monto),
      'montoInicial': serializer.toJson<double>(montoInicial),
      'created_at': serializer.toJson<DateTime>(created_at),
      'fechaDesde': serializer.toJson<DateTime>(fechaDesde),
      'fechaHasta': serializer.toJson<DateTime>(fechaHasta),
      'ignorarDemasBloqueos': serializer.toJson<int>(ignorarDemasBloqueos),
      'status': serializer.toJson<int>(status),
      'idMoneda': serializer.toJson<int>(idMoneda),
    };
  }

  Blocksplaysgeneral copyWith(
          {int id,
          int idLoteria,
          int idSorteo,
          String jugada,
          double monto,
          double montoInicial,
          DateTime created_at,
          DateTime fechaDesde,
          DateTime fechaHasta,
          int ignorarDemasBloqueos,
          int status,
          int idMoneda}) =>
      Blocksplaysgeneral(
        id: id ?? this.id,
        idLoteria: idLoteria ?? this.idLoteria,
        idSorteo: idSorteo ?? this.idSorteo,
        jugada: jugada ?? this.jugada,
        monto: monto ?? this.monto,
        montoInicial: montoInicial ?? this.montoInicial,
        created_at: created_at ?? this.created_at,
        fechaDesde: fechaDesde ?? this.fechaDesde,
        fechaHasta: fechaHasta ?? this.fechaHasta,
        ignorarDemasBloqueos: ignorarDemasBloqueos ?? this.ignorarDemasBloqueos,
        status: status ?? this.status,
        idMoneda: idMoneda ?? this.idMoneda,
      );
  @override
  String toString() {
    return (StringBuffer('Blocksplaysgeneral(')
          ..write('id: $id, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('jugada: $jugada, ')
          ..write('monto: $monto, ')
          ..write('montoInicial: $montoInicial, ')
          ..write('created_at: $created_at, ')
          ..write('fechaDesde: $fechaDesde, ')
          ..write('fechaHasta: $fechaHasta, ')
          ..write('ignorarDemasBloqueos: $ignorarDemasBloqueos, ')
          ..write('status: $status, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idLoteria.hashCode,
          $mrjc(
              idSorteo.hashCode,
              $mrjc(
                  jugada.hashCode,
                  $mrjc(
                      monto.hashCode,
                      $mrjc(
                          montoInicial.hashCode,
                          $mrjc(
                              created_at.hashCode,
                              $mrjc(
                                  fechaDesde.hashCode,
                                  $mrjc(
                                      fechaHasta.hashCode,
                                      $mrjc(
                                          ignorarDemasBloqueos.hashCode,
                                          $mrjc(status.hashCode,
                                              idMoneda.hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Blocksplaysgeneral &&
          other.id == this.id &&
          other.idLoteria == this.idLoteria &&
          other.idSorteo == this.idSorteo &&
          other.jugada == this.jugada &&
          other.monto == this.monto &&
          other.montoInicial == this.montoInicial &&
          other.created_at == this.created_at &&
          other.fechaDesde == this.fechaDesde &&
          other.fechaHasta == this.fechaHasta &&
          other.ignorarDemasBloqueos == this.ignorarDemasBloqueos &&
          other.status == this.status &&
          other.idMoneda == this.idMoneda);
}

class BlocksplaysgeneralsCompanion extends UpdateCompanion<Blocksplaysgeneral> {
  final Value<int> id;
  final Value<int> idLoteria;
  final Value<int> idSorteo;
  final Value<String> jugada;
  final Value<double> monto;
  final Value<double> montoInicial;
  final Value<DateTime> created_at;
  final Value<DateTime> fechaDesde;
  final Value<DateTime> fechaHasta;
  final Value<int> ignorarDemasBloqueos;
  final Value<int> status;
  final Value<int> idMoneda;
  const BlocksplaysgeneralsCompanion({
    this.id = const Value.absent(),
    this.idLoteria = const Value.absent(),
    this.idSorteo = const Value.absent(),
    this.jugada = const Value.absent(),
    this.monto = const Value.absent(),
    this.montoInicial = const Value.absent(),
    this.created_at = const Value.absent(),
    this.fechaDesde = const Value.absent(),
    this.fechaHasta = const Value.absent(),
    this.ignorarDemasBloqueos = const Value.absent(),
    this.status = const Value.absent(),
    this.idMoneda = const Value.absent(),
  });
  BlocksplaysgeneralsCompanion.insert({
    this.id = const Value.absent(),
    @required int idLoteria,
    @required int idSorteo,
    @required String jugada,
    @required double monto,
    @required double montoInicial,
    this.created_at = const Value.absent(),
    this.fechaDesde = const Value.absent(),
    this.fechaHasta = const Value.absent(),
    @required int ignorarDemasBloqueos,
    @required int status,
    @required int idMoneda,
  })  : idLoteria = Value(idLoteria),
        idSorteo = Value(idSorteo),
        jugada = Value(jugada),
        monto = Value(monto),
        montoInicial = Value(montoInicial),
        ignorarDemasBloqueos = Value(ignorarDemasBloqueos),
        status = Value(status),
        idMoneda = Value(idMoneda);
  static Insertable<Blocksplaysgeneral> custom({
    Expression<int> id,
    Expression<int> idLoteria,
    Expression<int> idSorteo,
    Expression<String> jugada,
    Expression<double> monto,
    Expression<double> montoInicial,
    Expression<DateTime> created_at,
    Expression<DateTime> fechaDesde,
    Expression<DateTime> fechaHasta,
    Expression<int> ignorarDemasBloqueos,
    Expression<int> status,
    Expression<int> idMoneda,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idLoteria != null) 'id_loteria': idLoteria,
      if (idSorteo != null) 'id_sorteo': idSorteo,
      if (jugada != null) 'jugada': jugada,
      if (monto != null) 'monto': monto,
      if (montoInicial != null) 'monto_inicial': montoInicial,
      if (created_at != null) 'created_at': created_at,
      if (fechaDesde != null) 'fecha_desde': fechaDesde,
      if (fechaHasta != null) 'fecha_hasta': fechaHasta,
      if (ignorarDemasBloqueos != null)
        'ignorar_demas_bloqueos': ignorarDemasBloqueos,
      if (status != null) 'status': status,
      if (idMoneda != null) 'id_moneda': idMoneda,
    });
  }

  BlocksplaysgeneralsCompanion copyWith(
      {Value<int> id,
      Value<int> idLoteria,
      Value<int> idSorteo,
      Value<String> jugada,
      Value<double> monto,
      Value<double> montoInicial,
      Value<DateTime> created_at,
      Value<DateTime> fechaDesde,
      Value<DateTime> fechaHasta,
      Value<int> ignorarDemasBloqueos,
      Value<int> status,
      Value<int> idMoneda}) {
    return BlocksplaysgeneralsCompanion(
      id: id ?? this.id,
      idLoteria: idLoteria ?? this.idLoteria,
      idSorteo: idSorteo ?? this.idSorteo,
      jugada: jugada ?? this.jugada,
      monto: monto ?? this.monto,
      montoInicial: montoInicial ?? this.montoInicial,
      created_at: created_at ?? this.created_at,
      fechaDesde: fechaDesde ?? this.fechaDesde,
      fechaHasta: fechaHasta ?? this.fechaHasta,
      ignorarDemasBloqueos: ignorarDemasBloqueos ?? this.ignorarDemasBloqueos,
      status: status ?? this.status,
      idMoneda: idMoneda ?? this.idMoneda,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idLoteria.present) {
      map['id_loteria'] = Variable<int>(idLoteria.value);
    }
    if (idSorteo.present) {
      map['id_sorteo'] = Variable<int>(idSorteo.value);
    }
    if (jugada.present) {
      map['jugada'] = Variable<String>(jugada.value);
    }
    if (monto.present) {
      map['monto'] = Variable<double>(monto.value);
    }
    if (montoInicial.present) {
      map['monto_inicial'] = Variable<double>(montoInicial.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (fechaDesde.present) {
      map['fecha_desde'] = Variable<DateTime>(fechaDesde.value);
    }
    if (fechaHasta.present) {
      map['fecha_hasta'] = Variable<DateTime>(fechaHasta.value);
    }
    if (ignorarDemasBloqueos.present) {
      map['ignorar_demas_bloqueos'] = Variable<int>(ignorarDemasBloqueos.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (idMoneda.present) {
      map['id_moneda'] = Variable<int>(idMoneda.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlocksplaysgeneralsCompanion(')
          ..write('id: $id, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('jugada: $jugada, ')
          ..write('monto: $monto, ')
          ..write('montoInicial: $montoInicial, ')
          ..write('created_at: $created_at, ')
          ..write('fechaDesde: $fechaDesde, ')
          ..write('fechaHasta: $fechaHasta, ')
          ..write('ignorarDemasBloqueos: $ignorarDemasBloqueos, ')
          ..write('status: $status, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }
}

class $BlocksplaysgeneralsTable extends Blocksplaysgenerals
    with TableInfo<$BlocksplaysgeneralsTable, Blocksplaysgeneral> {
  final GeneratedDatabase _db;
  final String _alias;
  $BlocksplaysgeneralsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idLoteriaMeta = const VerificationMeta('idLoteria');
  GeneratedIntColumn _idLoteria;
  @override
  GeneratedIntColumn get idLoteria => _idLoteria ??= _constructIdLoteria();
  GeneratedIntColumn _constructIdLoteria() {
    return GeneratedIntColumn(
      'id_loteria',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idSorteoMeta = const VerificationMeta('idSorteo');
  GeneratedIntColumn _idSorteo;
  @override
  GeneratedIntColumn get idSorteo => _idSorteo ??= _constructIdSorteo();
  GeneratedIntColumn _constructIdSorteo() {
    return GeneratedIntColumn(
      'id_sorteo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _jugadaMeta = const VerificationMeta('jugada');
  GeneratedTextColumn _jugada;
  @override
  GeneratedTextColumn get jugada => _jugada ??= _constructJugada();
  GeneratedTextColumn _constructJugada() {
    return GeneratedTextColumn(
      'jugada',
      $tableName,
      false,
    );
  }

  final VerificationMeta _montoMeta = const VerificationMeta('monto');
  GeneratedRealColumn _monto;
  @override
  GeneratedRealColumn get monto => _monto ??= _constructMonto();
  GeneratedRealColumn _constructMonto() {
    return GeneratedRealColumn(
      'monto',
      $tableName,
      false,
    );
  }

  final VerificationMeta _montoInicialMeta =
      const VerificationMeta('montoInicial');
  GeneratedRealColumn _montoInicial;
  @override
  GeneratedRealColumn get montoInicial =>
      _montoInicial ??= _constructMontoInicial();
  GeneratedRealColumn _constructMontoInicial() {
    return GeneratedRealColumn(
      'monto_inicial',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fechaDesdeMeta = const VerificationMeta('fechaDesde');
  GeneratedDateTimeColumn _fechaDesde;
  @override
  GeneratedDateTimeColumn get fechaDesde =>
      _fechaDesde ??= _constructFechaDesde();
  GeneratedDateTimeColumn _constructFechaDesde() {
    return GeneratedDateTimeColumn(
      'fecha_desde',
      $tableName,
      true,
    );
  }

  final VerificationMeta _fechaHastaMeta = const VerificationMeta('fechaHasta');
  GeneratedDateTimeColumn _fechaHasta;
  @override
  GeneratedDateTimeColumn get fechaHasta =>
      _fechaHasta ??= _constructFechaHasta();
  GeneratedDateTimeColumn _constructFechaHasta() {
    return GeneratedDateTimeColumn(
      'fecha_hasta',
      $tableName,
      true,
    );
  }

  final VerificationMeta _ignorarDemasBloqueosMeta =
      const VerificationMeta('ignorarDemasBloqueos');
  GeneratedIntColumn _ignorarDemasBloqueos;
  @override
  GeneratedIntColumn get ignorarDemasBloqueos =>
      _ignorarDemasBloqueos ??= _constructIgnorarDemasBloqueos();
  GeneratedIntColumn _constructIgnorarDemasBloqueos() {
    return GeneratedIntColumn(
      'ignorar_demas_bloqueos',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn(
      'status',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMonedaMeta = const VerificationMeta('idMoneda');
  GeneratedIntColumn _idMoneda;
  @override
  GeneratedIntColumn get idMoneda => _idMoneda ??= _constructIdMoneda();
  GeneratedIntColumn _constructIdMoneda() {
    return GeneratedIntColumn(
      'id_moneda',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        idLoteria,
        idSorteo,
        jugada,
        monto,
        montoInicial,
        created_at,
        fechaDesde,
        fechaHasta,
        ignorarDemasBloqueos,
        status,
        idMoneda
      ];
  @override
  $BlocksplaysgeneralsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'blocksplaysgenerals';
  @override
  final String actualTableName = 'blocksplaysgenerals';
  @override
  VerificationContext validateIntegrity(Insertable<Blocksplaysgeneral> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_loteria')) {
      context.handle(_idLoteriaMeta,
          idLoteria.isAcceptableOrUnknown(data['id_loteria'], _idLoteriaMeta));
    } else if (isInserting) {
      context.missing(_idLoteriaMeta);
    }
    if (data.containsKey('id_sorteo')) {
      context.handle(_idSorteoMeta,
          idSorteo.isAcceptableOrUnknown(data['id_sorteo'], _idSorteoMeta));
    } else if (isInserting) {
      context.missing(_idSorteoMeta);
    }
    if (data.containsKey('jugada')) {
      context.handle(_jugadaMeta,
          jugada.isAcceptableOrUnknown(data['jugada'], _jugadaMeta));
    } else if (isInserting) {
      context.missing(_jugadaMeta);
    }
    if (data.containsKey('monto')) {
      context.handle(
          _montoMeta, monto.isAcceptableOrUnknown(data['monto'], _montoMeta));
    } else if (isInserting) {
      context.missing(_montoMeta);
    }
    if (data.containsKey('monto_inicial')) {
      context.handle(
          _montoInicialMeta,
          montoInicial.isAcceptableOrUnknown(
              data['monto_inicial'], _montoInicialMeta));
    } else if (isInserting) {
      context.missing(_montoInicialMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('fecha_desde')) {
      context.handle(
          _fechaDesdeMeta,
          fechaDesde.isAcceptableOrUnknown(
              data['fecha_desde'], _fechaDesdeMeta));
    }
    if (data.containsKey('fecha_hasta')) {
      context.handle(
          _fechaHastaMeta,
          fechaHasta.isAcceptableOrUnknown(
              data['fecha_hasta'], _fechaHastaMeta));
    }
    if (data.containsKey('ignorar_demas_bloqueos')) {
      context.handle(
          _ignorarDemasBloqueosMeta,
          ignorarDemasBloqueos.isAcceptableOrUnknown(
              data['ignorar_demas_bloqueos'], _ignorarDemasBloqueosMeta));
    } else if (isInserting) {
      context.missing(_ignorarDemasBloqueosMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('id_moneda')) {
      context.handle(_idMonedaMeta,
          idMoneda.isAcceptableOrUnknown(data['id_moneda'], _idMonedaMeta));
    } else if (isInserting) {
      context.missing(_idMonedaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Blocksplaysgeneral map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Blocksplaysgeneral.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BlocksplaysgeneralsTable createAlias(String alias) {
    return $BlocksplaysgeneralsTable(_db, alias);
  }
}

class Draw extends DataClass implements Insertable<Draw> {
  final int id;
  final String descripcion;
  final DateTime created_at;
  final int bolos;
  final int cantidadNumeros;
  final int status;
  Draw(
      {@required this.id,
      @required this.descripcion,
      this.created_at,
      @required this.bolos,
      @required this.cantidadNumeros,
      @required this.status});
  factory Draw.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Draw(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      descripcion: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descripcion']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      bolos: intType.mapFromDatabaseResponse(data['${effectivePrefix}bolos']),
      cantidadNumeros: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}cantidad_numeros']),
      status: intType.mapFromDatabaseResponse(data['${effectivePrefix}status']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || descripcion != null) {
      map['descripcion'] = Variable<String>(descripcion);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || bolos != null) {
      map['bolos'] = Variable<int>(bolos);
    }
    if (!nullToAbsent || cantidadNumeros != null) {
      map['cantidad_numeros'] = Variable<int>(cantidadNumeros);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<int>(status);
    }
    return map;
  }

  DrawsCompanion toCompanion(bool nullToAbsent) {
    return DrawsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      descripcion: descripcion == null && nullToAbsent
          ? const Value.absent()
          : Value(descripcion),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      bolos:
          bolos == null && nullToAbsent ? const Value.absent() : Value(bolos),
      cantidadNumeros: cantidadNumeros == null && nullToAbsent
          ? const Value.absent()
          : Value(cantidadNumeros),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
    );
  }

  factory Draw.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Draw(
      id: serializer.fromJson<int>(json['id']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      bolos: serializer.fromJson<int>(json['bolos']),
      cantidadNumeros: serializer.fromJson<int>(json['cantidadNumeros']),
      status: serializer.fromJson<int>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descripcion': serializer.toJson<String>(descripcion),
      'created_at': serializer.toJson<DateTime>(created_at),
      'bolos': serializer.toJson<int>(bolos),
      'cantidadNumeros': serializer.toJson<int>(cantidadNumeros),
      'status': serializer.toJson<int>(status),
    };
  }

  Draw copyWith(
          {int id,
          String descripcion,
          DateTime created_at,
          int bolos,
          int cantidadNumeros,
          int status}) =>
      Draw(
        id: id ?? this.id,
        descripcion: descripcion ?? this.descripcion,
        created_at: created_at ?? this.created_at,
        bolos: bolos ?? this.bolos,
        cantidadNumeros: cantidadNumeros ?? this.cantidadNumeros,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('Draw(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('created_at: $created_at, ')
          ..write('bolos: $bolos, ')
          ..write('cantidadNumeros: $cantidadNumeros, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          descripcion.hashCode,
          $mrjc(
              created_at.hashCode,
              $mrjc(bolos.hashCode,
                  $mrjc(cantidadNumeros.hashCode, status.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Draw &&
          other.id == this.id &&
          other.descripcion == this.descripcion &&
          other.created_at == this.created_at &&
          other.bolos == this.bolos &&
          other.cantidadNumeros == this.cantidadNumeros &&
          other.status == this.status);
}

class DrawsCompanion extends UpdateCompanion<Draw> {
  final Value<int> id;
  final Value<String> descripcion;
  final Value<DateTime> created_at;
  final Value<int> bolos;
  final Value<int> cantidadNumeros;
  final Value<int> status;
  const DrawsCompanion({
    this.id = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.created_at = const Value.absent(),
    this.bolos = const Value.absent(),
    this.cantidadNumeros = const Value.absent(),
    this.status = const Value.absent(),
  });
  DrawsCompanion.insert({
    this.id = const Value.absent(),
    @required String descripcion,
    this.created_at = const Value.absent(),
    @required int bolos,
    @required int cantidadNumeros,
    @required int status,
  })  : descripcion = Value(descripcion),
        bolos = Value(bolos),
        cantidadNumeros = Value(cantidadNumeros),
        status = Value(status);
  static Insertable<Draw> custom({
    Expression<int> id,
    Expression<String> descripcion,
    Expression<DateTime> created_at,
    Expression<int> bolos,
    Expression<int> cantidadNumeros,
    Expression<int> status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descripcion != null) 'descripcion': descripcion,
      if (created_at != null) 'created_at': created_at,
      if (bolos != null) 'bolos': bolos,
      if (cantidadNumeros != null) 'cantidad_numeros': cantidadNumeros,
      if (status != null) 'status': status,
    });
  }

  DrawsCompanion copyWith(
      {Value<int> id,
      Value<String> descripcion,
      Value<DateTime> created_at,
      Value<int> bolos,
      Value<int> cantidadNumeros,
      Value<int> status}) {
    return DrawsCompanion(
      id: id ?? this.id,
      descripcion: descripcion ?? this.descripcion,
      created_at: created_at ?? this.created_at,
      bolos: bolos ?? this.bolos,
      cantidadNumeros: cantidadNumeros ?? this.cantidadNumeros,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (bolos.present) {
      map['bolos'] = Variable<int>(bolos.value);
    }
    if (cantidadNumeros.present) {
      map['cantidad_numeros'] = Variable<int>(cantidadNumeros.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DrawsCompanion(')
          ..write('id: $id, ')
          ..write('descripcion: $descripcion, ')
          ..write('created_at: $created_at, ')
          ..write('bolos: $bolos, ')
          ..write('cantidadNumeros: $cantidadNumeros, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $DrawsTable extends Draws with TableInfo<$DrawsTable, Draw> {
  final GeneratedDatabase _db;
  final String _alias;
  $DrawsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  GeneratedTextColumn _descripcion;
  @override
  GeneratedTextColumn get descripcion =>
      _descripcion ??= _constructDescripcion();
  GeneratedTextColumn _constructDescripcion() {
    return GeneratedTextColumn(
      'descripcion',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _bolosMeta = const VerificationMeta('bolos');
  GeneratedIntColumn _bolos;
  @override
  GeneratedIntColumn get bolos => _bolos ??= _constructBolos();
  GeneratedIntColumn _constructBolos() {
    return GeneratedIntColumn(
      'bolos',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cantidadNumerosMeta =
      const VerificationMeta('cantidadNumeros');
  GeneratedIntColumn _cantidadNumeros;
  @override
  GeneratedIntColumn get cantidadNumeros =>
      _cantidadNumeros ??= _constructCantidadNumeros();
  GeneratedIntColumn _constructCantidadNumeros() {
    return GeneratedIntColumn(
      'cantidad_numeros',
      $tableName,
      false,
    );
  }

  final VerificationMeta _statusMeta = const VerificationMeta('status');
  GeneratedIntColumn _status;
  @override
  GeneratedIntColumn get status => _status ??= _constructStatus();
  GeneratedIntColumn _constructStatus() {
    return GeneratedIntColumn(
      'status',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, descripcion, created_at, bolos, cantidadNumeros, status];
  @override
  $DrawsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'draws';
  @override
  final String actualTableName = 'draws';
  @override
  VerificationContext validateIntegrity(Insertable<Draw> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion'], _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('bolos')) {
      context.handle(
          _bolosMeta, bolos.isAcceptableOrUnknown(data['bolos'], _bolosMeta));
    } else if (isInserting) {
      context.missing(_bolosMeta);
    }
    if (data.containsKey('cantidad_numeros')) {
      context.handle(
          _cantidadNumerosMeta,
          cantidadNumeros.isAcceptableOrUnknown(
              data['cantidad_numeros'], _cantidadNumerosMeta));
    } else if (isInserting) {
      context.missing(_cantidadNumerosMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status'], _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Draw map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Draw.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DrawsTable createAlias(String alias) {
    return $DrawsTable(_db, alias);
  }
}

class Blocksdirty extends DataClass implements Insertable<Blocksdirty> {
  final int id;
  final int idBanca;
  final int idLoteria;
  final int idSorteo;
  final int cantidad;
  final DateTime created_at;
  final int idMoneda;
  Blocksdirty(
      {@required this.id,
      @required this.idBanca,
      @required this.idLoteria,
      @required this.idSorteo,
      @required this.cantidad,
      this.created_at,
      @required this.idMoneda});
  factory Blocksdirty.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Blocksdirty(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idBanca:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_banca']),
      idLoteria:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_loteria']),
      idSorteo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_sorteo']),
      cantidad:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}cantidad']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      idMoneda:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_moneda']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idBanca != null) {
      map['id_banca'] = Variable<int>(idBanca);
    }
    if (!nullToAbsent || idLoteria != null) {
      map['id_loteria'] = Variable<int>(idLoteria);
    }
    if (!nullToAbsent || idSorteo != null) {
      map['id_sorteo'] = Variable<int>(idSorteo);
    }
    if (!nullToAbsent || cantidad != null) {
      map['cantidad'] = Variable<int>(cantidad);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || idMoneda != null) {
      map['id_moneda'] = Variable<int>(idMoneda);
    }
    return map;
  }

  BlocksdirtysCompanion toCompanion(bool nullToAbsent) {
    return BlocksdirtysCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idBanca: idBanca == null && nullToAbsent
          ? const Value.absent()
          : Value(idBanca),
      idLoteria: idLoteria == null && nullToAbsent
          ? const Value.absent()
          : Value(idLoteria),
      idSorteo: idSorteo == null && nullToAbsent
          ? const Value.absent()
          : Value(idSorteo),
      cantidad: cantidad == null && nullToAbsent
          ? const Value.absent()
          : Value(cantidad),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      idMoneda: idMoneda == null && nullToAbsent
          ? const Value.absent()
          : Value(idMoneda),
    );
  }

  factory Blocksdirty.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Blocksdirty(
      id: serializer.fromJson<int>(json['id']),
      idBanca: serializer.fromJson<int>(json['idBanca']),
      idLoteria: serializer.fromJson<int>(json['idLoteria']),
      idSorteo: serializer.fromJson<int>(json['idSorteo']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      idMoneda: serializer.fromJson<int>(json['idMoneda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idBanca': serializer.toJson<int>(idBanca),
      'idLoteria': serializer.toJson<int>(idLoteria),
      'idSorteo': serializer.toJson<int>(idSorteo),
      'cantidad': serializer.toJson<int>(cantidad),
      'created_at': serializer.toJson<DateTime>(created_at),
      'idMoneda': serializer.toJson<int>(idMoneda),
    };
  }

  Blocksdirty copyWith(
          {int id,
          int idBanca,
          int idLoteria,
          int idSorteo,
          int cantidad,
          DateTime created_at,
          int idMoneda}) =>
      Blocksdirty(
        id: id ?? this.id,
        idBanca: idBanca ?? this.idBanca,
        idLoteria: idLoteria ?? this.idLoteria,
        idSorteo: idSorteo ?? this.idSorteo,
        cantidad: cantidad ?? this.cantidad,
        created_at: created_at ?? this.created_at,
        idMoneda: idMoneda ?? this.idMoneda,
      );
  @override
  String toString() {
    return (StringBuffer('Blocksdirty(')
          ..write('id: $id, ')
          ..write('idBanca: $idBanca, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('cantidad: $cantidad, ')
          ..write('created_at: $created_at, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idBanca.hashCode,
          $mrjc(
              idLoteria.hashCode,
              $mrjc(
                  idSorteo.hashCode,
                  $mrjc(cantidad.hashCode,
                      $mrjc(created_at.hashCode, idMoneda.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Blocksdirty &&
          other.id == this.id &&
          other.idBanca == this.idBanca &&
          other.idLoteria == this.idLoteria &&
          other.idSorteo == this.idSorteo &&
          other.cantidad == this.cantidad &&
          other.created_at == this.created_at &&
          other.idMoneda == this.idMoneda);
}

class BlocksdirtysCompanion extends UpdateCompanion<Blocksdirty> {
  final Value<int> id;
  final Value<int> idBanca;
  final Value<int> idLoteria;
  final Value<int> idSorteo;
  final Value<int> cantidad;
  final Value<DateTime> created_at;
  final Value<int> idMoneda;
  const BlocksdirtysCompanion({
    this.id = const Value.absent(),
    this.idBanca = const Value.absent(),
    this.idLoteria = const Value.absent(),
    this.idSorteo = const Value.absent(),
    this.cantidad = const Value.absent(),
    this.created_at = const Value.absent(),
    this.idMoneda = const Value.absent(),
  });
  BlocksdirtysCompanion.insert({
    this.id = const Value.absent(),
    @required int idBanca,
    @required int idLoteria,
    @required int idSorteo,
    @required int cantidad,
    this.created_at = const Value.absent(),
    @required int idMoneda,
  })  : idBanca = Value(idBanca),
        idLoteria = Value(idLoteria),
        idSorteo = Value(idSorteo),
        cantidad = Value(cantidad),
        idMoneda = Value(idMoneda);
  static Insertable<Blocksdirty> custom({
    Expression<int> id,
    Expression<int> idBanca,
    Expression<int> idLoteria,
    Expression<int> idSorteo,
    Expression<int> cantidad,
    Expression<DateTime> created_at,
    Expression<int> idMoneda,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idBanca != null) 'id_banca': idBanca,
      if (idLoteria != null) 'id_loteria': idLoteria,
      if (idSorteo != null) 'id_sorteo': idSorteo,
      if (cantidad != null) 'cantidad': cantidad,
      if (created_at != null) 'created_at': created_at,
      if (idMoneda != null) 'id_moneda': idMoneda,
    });
  }

  BlocksdirtysCompanion copyWith(
      {Value<int> id,
      Value<int> idBanca,
      Value<int> idLoteria,
      Value<int> idSorteo,
      Value<int> cantidad,
      Value<DateTime> created_at,
      Value<int> idMoneda}) {
    return BlocksdirtysCompanion(
      id: id ?? this.id,
      idBanca: idBanca ?? this.idBanca,
      idLoteria: idLoteria ?? this.idLoteria,
      idSorteo: idSorteo ?? this.idSorteo,
      cantidad: cantidad ?? this.cantidad,
      created_at: created_at ?? this.created_at,
      idMoneda: idMoneda ?? this.idMoneda,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idBanca.present) {
      map['id_banca'] = Variable<int>(idBanca.value);
    }
    if (idLoteria.present) {
      map['id_loteria'] = Variable<int>(idLoteria.value);
    }
    if (idSorteo.present) {
      map['id_sorteo'] = Variable<int>(idSorteo.value);
    }
    if (cantidad.present) {
      map['cantidad'] = Variable<int>(cantidad.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (idMoneda.present) {
      map['id_moneda'] = Variable<int>(idMoneda.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlocksdirtysCompanion(')
          ..write('id: $id, ')
          ..write('idBanca: $idBanca, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('cantidad: $cantidad, ')
          ..write('created_at: $created_at, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }
}

class $BlocksdirtysTable extends Blocksdirtys
    with TableInfo<$BlocksdirtysTable, Blocksdirty> {
  final GeneratedDatabase _db;
  final String _alias;
  $BlocksdirtysTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idBancaMeta = const VerificationMeta('idBanca');
  GeneratedIntColumn _idBanca;
  @override
  GeneratedIntColumn get idBanca => _idBanca ??= _constructIdBanca();
  GeneratedIntColumn _constructIdBanca() {
    return GeneratedIntColumn(
      'id_banca',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idLoteriaMeta = const VerificationMeta('idLoteria');
  GeneratedIntColumn _idLoteria;
  @override
  GeneratedIntColumn get idLoteria => _idLoteria ??= _constructIdLoteria();
  GeneratedIntColumn _constructIdLoteria() {
    return GeneratedIntColumn(
      'id_loteria',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idSorteoMeta = const VerificationMeta('idSorteo');
  GeneratedIntColumn _idSorteo;
  @override
  GeneratedIntColumn get idSorteo => _idSorteo ??= _constructIdSorteo();
  GeneratedIntColumn _constructIdSorteo() {
    return GeneratedIntColumn(
      'id_sorteo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cantidadMeta = const VerificationMeta('cantidad');
  GeneratedIntColumn _cantidad;
  @override
  GeneratedIntColumn get cantidad => _cantidad ??= _constructCantidad();
  GeneratedIntColumn _constructCantidad() {
    return GeneratedIntColumn(
      'cantidad',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMonedaMeta = const VerificationMeta('idMoneda');
  GeneratedIntColumn _idMoneda;
  @override
  GeneratedIntColumn get idMoneda => _idMoneda ??= _constructIdMoneda();
  GeneratedIntColumn _constructIdMoneda() {
    return GeneratedIntColumn(
      'id_moneda',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, idBanca, idLoteria, idSorteo, cantidad, created_at, idMoneda];
  @override
  $BlocksdirtysTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'blocksdirtys';
  @override
  final String actualTableName = 'blocksdirtys';
  @override
  VerificationContext validateIntegrity(Insertable<Blocksdirty> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_banca')) {
      context.handle(_idBancaMeta,
          idBanca.isAcceptableOrUnknown(data['id_banca'], _idBancaMeta));
    } else if (isInserting) {
      context.missing(_idBancaMeta);
    }
    if (data.containsKey('id_loteria')) {
      context.handle(_idLoteriaMeta,
          idLoteria.isAcceptableOrUnknown(data['id_loteria'], _idLoteriaMeta));
    } else if (isInserting) {
      context.missing(_idLoteriaMeta);
    }
    if (data.containsKey('id_sorteo')) {
      context.handle(_idSorteoMeta,
          idSorteo.isAcceptableOrUnknown(data['id_sorteo'], _idSorteoMeta));
    } else if (isInserting) {
      context.missing(_idSorteoMeta);
    }
    if (data.containsKey('cantidad')) {
      context.handle(_cantidadMeta,
          cantidad.isAcceptableOrUnknown(data['cantidad'], _cantidadMeta));
    } else if (isInserting) {
      context.missing(_cantidadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('id_moneda')) {
      context.handle(_idMonedaMeta,
          idMoneda.isAcceptableOrUnknown(data['id_moneda'], _idMonedaMeta));
    } else if (isInserting) {
      context.missing(_idMonedaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Blocksdirty map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Blocksdirty.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BlocksdirtysTable createAlias(String alias) {
    return $BlocksdirtysTable(_db, alias);
  }
}

class Blocksdirtygeneral extends DataClass
    implements Insertable<Blocksdirtygeneral> {
  final int id;
  final int idLoteria;
  final int idSorteo;
  final int cantidad;
  final DateTime created_at;
  final int idMoneda;
  Blocksdirtygeneral(
      {@required this.id,
      @required this.idLoteria,
      @required this.idSorteo,
      @required this.cantidad,
      this.created_at,
      @required this.idMoneda});
  factory Blocksdirtygeneral.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return Blocksdirtygeneral(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      idLoteria:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_loteria']),
      idSorteo:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_sorteo']),
      cantidad:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}cantidad']),
      created_at: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      idMoneda:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}id_moneda']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || idLoteria != null) {
      map['id_loteria'] = Variable<int>(idLoteria);
    }
    if (!nullToAbsent || idSorteo != null) {
      map['id_sorteo'] = Variable<int>(idSorteo);
    }
    if (!nullToAbsent || cantidad != null) {
      map['cantidad'] = Variable<int>(cantidad);
    }
    if (!nullToAbsent || created_at != null) {
      map['created_at'] = Variable<DateTime>(created_at);
    }
    if (!nullToAbsent || idMoneda != null) {
      map['id_moneda'] = Variable<int>(idMoneda);
    }
    return map;
  }

  BlocksdirtygeneralsCompanion toCompanion(bool nullToAbsent) {
    return BlocksdirtygeneralsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idLoteria: idLoteria == null && nullToAbsent
          ? const Value.absent()
          : Value(idLoteria),
      idSorteo: idSorteo == null && nullToAbsent
          ? const Value.absent()
          : Value(idSorteo),
      cantidad: cantidad == null && nullToAbsent
          ? const Value.absent()
          : Value(cantidad),
      created_at: created_at == null && nullToAbsent
          ? const Value.absent()
          : Value(created_at),
      idMoneda: idMoneda == null && nullToAbsent
          ? const Value.absent()
          : Value(idMoneda),
    );
  }

  factory Blocksdirtygeneral.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Blocksdirtygeneral(
      id: serializer.fromJson<int>(json['id']),
      idLoteria: serializer.fromJson<int>(json['idLoteria']),
      idSorteo: serializer.fromJson<int>(json['idSorteo']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      created_at: serializer.fromJson<DateTime>(json['created_at']),
      idMoneda: serializer.fromJson<int>(json['idMoneda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idLoteria': serializer.toJson<int>(idLoteria),
      'idSorteo': serializer.toJson<int>(idSorteo),
      'cantidad': serializer.toJson<int>(cantidad),
      'created_at': serializer.toJson<DateTime>(created_at),
      'idMoneda': serializer.toJson<int>(idMoneda),
    };
  }

  Blocksdirtygeneral copyWith(
          {int id,
          int idLoteria,
          int idSorteo,
          int cantidad,
          DateTime created_at,
          int idMoneda}) =>
      Blocksdirtygeneral(
        id: id ?? this.id,
        idLoteria: idLoteria ?? this.idLoteria,
        idSorteo: idSorteo ?? this.idSorteo,
        cantidad: cantidad ?? this.cantidad,
        created_at: created_at ?? this.created_at,
        idMoneda: idMoneda ?? this.idMoneda,
      );
  @override
  String toString() {
    return (StringBuffer('Blocksdirtygeneral(')
          ..write('id: $id, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('cantidad: $cantidad, ')
          ..write('created_at: $created_at, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          idLoteria.hashCode,
          $mrjc(
              idSorteo.hashCode,
              $mrjc(cantidad.hashCode,
                  $mrjc(created_at.hashCode, idMoneda.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Blocksdirtygeneral &&
          other.id == this.id &&
          other.idLoteria == this.idLoteria &&
          other.idSorteo == this.idSorteo &&
          other.cantidad == this.cantidad &&
          other.created_at == this.created_at &&
          other.idMoneda == this.idMoneda);
}

class BlocksdirtygeneralsCompanion extends UpdateCompanion<Blocksdirtygeneral> {
  final Value<int> id;
  final Value<int> idLoteria;
  final Value<int> idSorteo;
  final Value<int> cantidad;
  final Value<DateTime> created_at;
  final Value<int> idMoneda;
  const BlocksdirtygeneralsCompanion({
    this.id = const Value.absent(),
    this.idLoteria = const Value.absent(),
    this.idSorteo = const Value.absent(),
    this.cantidad = const Value.absent(),
    this.created_at = const Value.absent(),
    this.idMoneda = const Value.absent(),
  });
  BlocksdirtygeneralsCompanion.insert({
    this.id = const Value.absent(),
    @required int idLoteria,
    @required int idSorteo,
    @required int cantidad,
    this.created_at = const Value.absent(),
    @required int idMoneda,
  })  : idLoteria = Value(idLoteria),
        idSorteo = Value(idSorteo),
        cantidad = Value(cantidad),
        idMoneda = Value(idMoneda);
  static Insertable<Blocksdirtygeneral> custom({
    Expression<int> id,
    Expression<int> idLoteria,
    Expression<int> idSorteo,
    Expression<int> cantidad,
    Expression<DateTime> created_at,
    Expression<int> idMoneda,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idLoteria != null) 'id_loteria': idLoteria,
      if (idSorteo != null) 'id_sorteo': idSorteo,
      if (cantidad != null) 'cantidad': cantidad,
      if (created_at != null) 'created_at': created_at,
      if (idMoneda != null) 'id_moneda': idMoneda,
    });
  }

  BlocksdirtygeneralsCompanion copyWith(
      {Value<int> id,
      Value<int> idLoteria,
      Value<int> idSorteo,
      Value<int> cantidad,
      Value<DateTime> created_at,
      Value<int> idMoneda}) {
    return BlocksdirtygeneralsCompanion(
      id: id ?? this.id,
      idLoteria: idLoteria ?? this.idLoteria,
      idSorteo: idSorteo ?? this.idSorteo,
      cantidad: cantidad ?? this.cantidad,
      created_at: created_at ?? this.created_at,
      idMoneda: idMoneda ?? this.idMoneda,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idLoteria.present) {
      map['id_loteria'] = Variable<int>(idLoteria.value);
    }
    if (idSorteo.present) {
      map['id_sorteo'] = Variable<int>(idSorteo.value);
    }
    if (cantidad.present) {
      map['cantidad'] = Variable<int>(cantidad.value);
    }
    if (created_at.present) {
      map['created_at'] = Variable<DateTime>(created_at.value);
    }
    if (idMoneda.present) {
      map['id_moneda'] = Variable<int>(idMoneda.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BlocksdirtygeneralsCompanion(')
          ..write('id: $id, ')
          ..write('idLoteria: $idLoteria, ')
          ..write('idSorteo: $idSorteo, ')
          ..write('cantidad: $cantidad, ')
          ..write('created_at: $created_at, ')
          ..write('idMoneda: $idMoneda')
          ..write(')'))
        .toString();
  }
}

class $BlocksdirtygeneralsTable extends Blocksdirtygenerals
    with TableInfo<$BlocksdirtygeneralsTable, Blocksdirtygeneral> {
  final GeneratedDatabase _db;
  final String _alias;
  $BlocksdirtygeneralsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn(
      'id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idLoteriaMeta = const VerificationMeta('idLoteria');
  GeneratedIntColumn _idLoteria;
  @override
  GeneratedIntColumn get idLoteria => _idLoteria ??= _constructIdLoteria();
  GeneratedIntColumn _constructIdLoteria() {
    return GeneratedIntColumn(
      'id_loteria',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idSorteoMeta = const VerificationMeta('idSorteo');
  GeneratedIntColumn _idSorteo;
  @override
  GeneratedIntColumn get idSorteo => _idSorteo ??= _constructIdSorteo();
  GeneratedIntColumn _constructIdSorteo() {
    return GeneratedIntColumn(
      'id_sorteo',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cantidadMeta = const VerificationMeta('cantidad');
  GeneratedIntColumn _cantidad;
  @override
  GeneratedIntColumn get cantidad => _cantidad ??= _constructCantidad();
  GeneratedIntColumn _constructCantidad() {
    return GeneratedIntColumn(
      'cantidad',
      $tableName,
      false,
    );
  }

  final VerificationMeta _created_atMeta = const VerificationMeta('created_at');
  GeneratedDateTimeColumn _created_at;
  @override
  GeneratedDateTimeColumn get created_at =>
      _created_at ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _idMonedaMeta = const VerificationMeta('idMoneda');
  GeneratedIntColumn _idMoneda;
  @override
  GeneratedIntColumn get idMoneda => _idMoneda ??= _constructIdMoneda();
  GeneratedIntColumn _constructIdMoneda() {
    return GeneratedIntColumn(
      'id_moneda',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, idLoteria, idSorteo, cantidad, created_at, idMoneda];
  @override
  $BlocksdirtygeneralsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'blocksdirtygenerals';
  @override
  final String actualTableName = 'blocksdirtygenerals';
  @override
  VerificationContext validateIntegrity(Insertable<Blocksdirtygeneral> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('id_loteria')) {
      context.handle(_idLoteriaMeta,
          idLoteria.isAcceptableOrUnknown(data['id_loteria'], _idLoteriaMeta));
    } else if (isInserting) {
      context.missing(_idLoteriaMeta);
    }
    if (data.containsKey('id_sorteo')) {
      context.handle(_idSorteoMeta,
          idSorteo.isAcceptableOrUnknown(data['id_sorteo'], _idSorteoMeta));
    } else if (isInserting) {
      context.missing(_idSorteoMeta);
    }
    if (data.containsKey('cantidad')) {
      context.handle(_cantidadMeta,
          cantidad.isAcceptableOrUnknown(data['cantidad'], _cantidadMeta));
    } else if (isInserting) {
      context.missing(_cantidadMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
          _created_atMeta,
          created_at.isAcceptableOrUnknown(
              data['created_at'], _created_atMeta));
    }
    if (data.containsKey('id_moneda')) {
      context.handle(_idMonedaMeta,
          idMoneda.isAcceptableOrUnknown(data['id_moneda'], _idMonedaMeta));
    } else if (isInserting) {
      context.missing(_idMonedaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Blocksdirtygeneral map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Blocksdirtygeneral.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BlocksdirtygeneralsTable createAlias(String alias) {
    return $BlocksdirtygeneralsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $TasksTable _tasks;
  $TasksTable get tasks => _tasks ??= $TasksTable(this);
  $PermissionsTable _permissions;
  $PermissionsTable get permissions => _permissions ??= $PermissionsTable(this);
  $UsersTable _users;
  $UsersTable get users => _users ??= $UsersTable(this);
  $SettingsTable _settings;
  $SettingsTable get settings => _settings ??= $SettingsTable(this);
  $BranchsTable _branchs;
  $BranchsTable get branchs => _branchs ??= $BranchsTable(this);
  $ServersTable _servers;
  $ServersTable get servers => _servers ??= $ServersTable(this);
  $StocksTable _stocks;
  $StocksTable get stocks => _stocks ??= $StocksTable(this);
  $BlocksgeneralsTable _blocksgenerals;
  $BlocksgeneralsTable get blocksgenerals =>
      _blocksgenerals ??= $BlocksgeneralsTable(this);
  $BlockslotteriesTable _blockslotteries;
  $BlockslotteriesTable get blockslotteries =>
      _blockslotteries ??= $BlockslotteriesTable(this);
  $BlocksplaysTable _blocksplays;
  $BlocksplaysTable get blocksplays => _blocksplays ??= $BlocksplaysTable(this);
  $BlocksplaysgeneralsTable _blocksplaysgenerals;
  $BlocksplaysgeneralsTable get blocksplaysgenerals =>
      _blocksplaysgenerals ??= $BlocksplaysgeneralsTable(this);
  $DrawsTable _draws;
  $DrawsTable get draws => _draws ??= $DrawsTable(this);
  $BlocksdirtysTable _blocksdirtys;
  $BlocksdirtysTable get blocksdirtys =>
      _blocksdirtys ??= $BlocksdirtysTable(this);
  $BlocksdirtygeneralsTable _blocksdirtygenerals;
  $BlocksdirtygeneralsTable get blocksdirtygenerals =>
      _blocksdirtygenerals ??= $BlocksdirtygeneralsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        tasks,
        permissions,
        users,
        settings,
        branchs,
        servers,
        stocks,
        blocksgenerals,
        blockslotteries,
        blocksplays,
        blocksplaysgenerals,
        draws,
        blocksdirtys,
        blocksdirtygenerals
      ];
}