<?php

/**
 * TeamPlayer form base class.
 *
 * @method TeamPlayer getObject() Returns the current form's model object
 *
 * @package    tp-taller
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseTeamPlayerForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'team_id'    => new sfWidgetFormInputHidden(),
      'player_id'  => new sfWidgetFormInputHidden(),
      'created_at' => new sfWidgetFormDateTime(),
      'updated_at' => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'team_id'    => new sfValidatorChoice(array('choices' => array($this->getObject()->get('team_id')), 'empty_value' => $this->getObject()->get('team_id'), 'required' => false)),
      'player_id'  => new sfValidatorChoice(array('choices' => array($this->getObject()->get('player_id')), 'empty_value' => $this->getObject()->get('player_id'), 'required' => false)),
      'created_at' => new sfValidatorDateTime(),
      'updated_at' => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('team_player[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'TeamPlayer';
  }

}
