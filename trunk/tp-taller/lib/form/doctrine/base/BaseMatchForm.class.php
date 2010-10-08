<?php

/**
 * Match form base class.
 *
 * @method Match getObject() Returns the current form's model object
 *
 * @package    tp-taller
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseMatchForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'            => new sfWidgetFormInputHidden(),
      'starting_time' => new sfWidgetFormDateTime(),
      'closed'        => new sfWidgetFormInputCheckbox(),
      'played'        => new sfWidgetFormInputCheckbox(),
      'public'        => new sfWidgetFormInputCheckbox(),
      'discipline_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Discipline'), 'add_empty' => false)),
      'owner_id'      => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Owner'), 'add_empty' => true)),
      'rental_id'     => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Court'), 'add_empty' => true)),
      'local_id'      => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('LocalTeam'), 'add_empty' => true)),
      'away_id'       => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('AwayTeam'), 'add_empty' => true)),
      'created_at'    => new sfWidgetFormDateTime(),
      'updated_at'    => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'id'            => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'starting_time' => new sfValidatorDateTime(array('required' => false)),
      'closed'        => new sfValidatorBoolean(array('required' => false)),
      'played'        => new sfValidatorBoolean(array('required' => false)),
      'public'        => new sfValidatorBoolean(array('required' => false)),
      'discipline_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Discipline'))),
      'owner_id'      => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Owner'), 'required' => false)),
      'rental_id'     => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Court'), 'required' => false)),
      'local_id'      => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('LocalTeam'), 'required' => false)),
      'away_id'       => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('AwayTeam'), 'required' => false)),
      'created_at'    => new sfValidatorDateTime(),
      'updated_at'    => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('match[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'Match';
  }

}
