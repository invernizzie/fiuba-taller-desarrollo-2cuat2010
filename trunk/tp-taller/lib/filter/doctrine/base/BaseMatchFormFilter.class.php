<?php

/**
 * Match filter form base class.
 *
 * @package    tp-taller
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BaseMatchFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'starting_time'    => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate())),
      'closed'           => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'played'           => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'public'           => new sfWidgetFormChoice(array('choices' => array('' => 'yes or no', 1 => 'yes', 0 => 'no'))),
      'discipline_id'    => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Discipline'), 'add_empty' => true)),
      'owner_id'         => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Owner'), 'add_empty' => true)),
      'playing_field_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Court'), 'add_empty' => true)),
      'local_id'         => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('LocalTeam'), 'add_empty' => true)),
      'away_id'          => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('AwayTeam'), 'add_empty' => true)),
      'created_at'       => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
      'updated_at'       => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate(), 'with_empty' => false)),
    ));

    $this->setValidators(array(
      'starting_time'    => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'closed'           => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'played'           => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'public'           => new sfValidatorChoice(array('required' => false, 'choices' => array('', 1, 0))),
      'discipline_id'    => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Discipline'), 'column' => 'id')),
      'owner_id'         => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Owner'), 'column' => 'id')),
      'playing_field_id' => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('Court'), 'column' => 'id')),
      'local_id'         => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('LocalTeam'), 'column' => 'id')),
      'away_id'          => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('AwayTeam'), 'column' => 'id')),
      'created_at'       => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
      'updated_at'       => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 00:00:00')), 'to_date' => new sfValidatorDateTime(array('required' => false, 'datetime_output' => 'Y-m-d 23:59:59')))),
    ));

    $this->widgetSchema->setNameFormat('match_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'Match';
  }

  public function getFields()
  {
    return array(
      'id'               => 'Number',
      'starting_time'    => 'Date',
      'closed'           => 'Boolean',
      'played'           => 'Boolean',
      'public'           => 'Boolean',
      'discipline_id'    => 'ForeignKey',
      'owner_id'         => 'ForeignKey',
      'playing_field_id' => 'ForeignKey',
      'local_id'         => 'ForeignKey',
      'away_id'          => 'ForeignKey',
      'created_at'       => 'Date',
      'updated_at'       => 'Date',
    );
  }
}
