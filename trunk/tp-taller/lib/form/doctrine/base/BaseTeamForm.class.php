<?php

/**
 * Team form base class.
 *
 * @method Team getObject() Returns the current form's model object
 *
 * @package    tp-taller
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BaseTeamForm extends BaseFormDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'id'            => new sfWidgetFormInputHidden(),
      'name'          => new sfWidgetFormInputText(),
      'discipline_id' => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('Discipline'), 'add_empty' => false)),
      'created_at'    => new sfWidgetFormDateTime(),
      'updated_at'    => new sfWidgetFormDateTime(),
      'players_list'  => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardUserProfile')),
    ));

    $this->setValidators(array(
      'id'            => new sfValidatorChoice(array('choices' => array($this->getObject()->get('id')), 'empty_value' => $this->getObject()->get('id'), 'required' => false)),
      'name'          => new sfValidatorString(array('max_length' => 255, 'required' => false)),
      'discipline_id' => new sfValidatorDoctrineChoice(array('model' => $this->getRelatedModelName('Discipline'))),
      'created_at'    => new sfValidatorDateTime(),
      'updated_at'    => new sfValidatorDateTime(),
      'players_list'  => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'sfGuardUserProfile', 'required' => false)),
    ));

    $this->widgetSchema->setNameFormat('team[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function getModelName()
  {
    return 'Team';
  }

  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();

    if (isset($this->widgetSchema['players_list']))
    {
      $this->setDefault('players_list', $this->object->Players->getPrimaryKeys());
    }

  }

  protected function doSave($con = null)
  {
    $this->savePlayersList($con);

    parent::doSave($con);
  }

  public function savePlayersList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['players_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Players->getPrimaryKeys();
    $values = $this->getValue('players_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Players', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Players', array_values($link));
    }
  }

}
