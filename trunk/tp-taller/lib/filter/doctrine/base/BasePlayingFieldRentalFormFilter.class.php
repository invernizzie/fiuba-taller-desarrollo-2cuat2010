<?php

/**
 * PlayingFieldRental filter form base class.
 *
 * @package    tp-taller
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BasePlayingFieldRentalFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'name'             => new sfWidgetFormFilterInput(array('with_empty' => false)),
      'address'          => new sfWidgetFormFilterInput(),
      'city'             => new sfWidgetFormFilterInput(),
      'province'         => new sfWidgetFormFilterInput(),
      'country'          => new sfWidgetFormFilterInput(),
      'phoneNo'          => new sfWidgetFormFilterInput(),
      'created_at'       => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'updated_at'       => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'disciplines_list' => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Discipline')),
    ));

    $this->setValidators(array(
      'name'             => new sfValidatorPass(array('required' => false)),
      'address'          => new sfValidatorPass(array('required' => false)),
      'city'             => new sfValidatorPass(array('required' => false)),
      'province'         => new sfValidatorPass(array('required' => false)),
      'country'          => new sfValidatorPass(array('required' => false)),
      'phoneNo'          => new sfValidatorPass(array('required' => false)),
      'created_at'       => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'updated_at'       => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'disciplines_list' => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Discipline', 'required' => false)),
    ));

    $this->widgetSchema->setNameFormat('playing_field_rental_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function addDisciplinesListColumnQuery(Doctrine_Query $query, $field, $values)
  {
    if (!is_array($values))
    {
      $values = array($values);
    }

    if (!count($values))
    {
      return;
    }

    $query
      ->leftJoin($query->getRootAlias().'.RentalDiscipline RentalDiscipline')
      ->andWhereIn('RentalDiscipline.discipline_id', $values)
    ;
  }

  public function getModelName()
  {
    return 'PlayingFieldRental';
  }

  public function getFields()
  {
    return array(
      'id'               => 'Number',
      'name'             => 'Text',
      'address'          => 'Text',
      'city'             => 'Text',
      'province'         => 'Text',
      'country'          => 'Text',
      'phoneNo'          => 'Text',
      'created_at'       => 'Date',
      'updated_at'       => 'Date',
      'disciplines_list' => 'ManyKey',
    );
  }
}
