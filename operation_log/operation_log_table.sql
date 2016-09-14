drop table operation_log_table purge;

create table operation_log_table (
  id               number,
  tm               date                 not null,
  txt              varchar2(4000)       not null,
--caller           varchar2(4000)       not null,
  caller_type      varchar2(  32)       not null,
  caller_name      varchar2(  30)       not null,
  caller_pkg_name  varchar2(  30)       not null,
  caller_line      number  (   6)       not null,
  caller_owner     varchar2(  30)       not null,
  --
  is_exception     varchar2(   1)       not null check(is_exception in ('N', 'Y')),
  id_parent        number,
  error_backtrace  varchar2(4000),
  --
  constraint       operation_log_table_pk  primary key (id),
  constraint operation_log_fk1 foreign key (id_parent) references operation_log_table
);

drop   sequence operation_log_seq;
create sequence operation_log_seq;
