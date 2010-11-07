<?php

/**
 * PlayingFieldRental form base class.
 *
 * @method PlayingFieldRental getObject() Returns the current form's model object
 *
 * @package    tp-taller
 * @subpackage form
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormGeneratedInheritanceTemplate.php 29553 2010-05-20 14:33:00Z Kris.Wallsmith $
 */
abstract class BasePlayingFieldRentalForm extends PlayingFieldForm
{
  protected function setupInheritance()
  {
    parent::setupInheritance();

    $this->widgetSchema   ['disciplines_list'] = new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Discipline'));
    $this->validatorSchema['disciplines_list'] = new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Discipline', 'required' => false));

    $this->widgetSchema->setNameFormat('playing_field_rental[%s]');
  }

  public function getModelName()
  {
    return 'PlayingFieldRental';
  }

  public function updateDefaultsFromObject()
  {
    parent::updateDefaultsFromObject();

    if (isset($this->widgetSchema['disciplines_list']))
    {
      $this->setDefault('disciplines_list', $this->object->Disciplines->getPrimaryKeys());
    }

  }

  protected function doSave($con = null)
  {
    $this->saveDisciplinesList($con);

    parent::doSave($con);
  }

  public function saveDisciplinesList($con = null)
  {
    if (!$this->isValid())
    {
      throw $this->getErrorSchema();
    }

    if (!isset($this->widgetSchema['disciplines_list']))
    {
      // somebody has unset this widget
      return;
    }

    if (null === $con)
    {
      $con = $this->getConnection();
    }

    $existing = $this->object->Disciplines->getPrimaryKeys();
    $values = $this->getValue('disciplines_list');
    if (!is_array($values))
    {
      $values = array();
    }

    $unlink = array_diff($existing, $values);
    if (count($unlink))
    {
      $this->object->unlink('Disciplines', array_values($unlink));
    }

    $link = array_diff($values, $existing);
    if (count($link))
    {
      $this->object->link('Disciplines', array_values($link));
    }
  }

}
