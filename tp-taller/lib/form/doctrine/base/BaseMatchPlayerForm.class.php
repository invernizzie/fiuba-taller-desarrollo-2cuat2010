<?php

/**
 * MatchPlayer form base class.
 *
 * @method MatchPlayer getObject() Returns the current form's model object
 *
 * @package    tp-taller
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseMatchPlayerForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'match_id'   => new sfWidgetFormInputHidden(),
      'player_id'  => new sfWidgetFormInputHidden(),
      'created_at' => new sfWidgetFormDateTime(),
      'updated_at' => new sfWidgetFormDateTime(),
    ));

    $this->setValidators(array(
      'match_id'   => new sfValidatorChoice(array('choices' => array($this->getObject()->get('match_id')), 'empty_value' => $this->getObject()->get('match_id'), 'required' => false)),
      'player_id'  => new sfValidatorChoice(array('choices' => array($this->getObject()->get('player_id')), 'empty_value' => $this->getObject()->get('player_id'), 'required' => false)),
      'created_at' => new sfValidatorDateTime(),
      'updated_at' => new sfValidatorDateTime(),
    ));

    $this->widgetSchema->setNameFormat('match_player[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'MatchPlayer';
  }

}
