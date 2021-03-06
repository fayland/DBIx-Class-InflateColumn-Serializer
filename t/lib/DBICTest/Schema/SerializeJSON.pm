package # hide from PAUSE
    DBICTest::Schema::SerializeJSON;

use base qw/DBIx::Class/;

__PACKAGE__->load_components (qw/InflateColumn::Serializer Core/);

__PACKAGE__->table('testtable');
__PACKAGE__->add_columns(
  'testtable_id' => {
    data_type => 'integer',
  },
  'serial1' => {
    data_type => 'varchar',
    size => 100,
    serializer_class => 'JSON',
    is_nullable => 1,
  },
  'serial2' => {
    data_type => 'varchar',
    is_nullable => 1,
  }
);

__PACKAGE__->set_primary_key('testtable_id');
__PACKAGE__->set_serialize_column('serial2', 'JSON');

1;

