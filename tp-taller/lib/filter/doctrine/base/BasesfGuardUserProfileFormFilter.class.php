<?php

/**
 * sfGuardUserProfile filter form base class.
 *
 * @package    tp-taller
 * @subpackage filter
 * @author     Your name here
 * @version    SVN: $Id: sfDoctrineFormFilterGeneratedTemplate.php 29570 2010-05-21 14:49:47Z Kris.Wallsmith $
 */
abstract class BasesfGuardUserProfileFormFilter extends BaseFormFilterDoctrine
{
  public function setup()
  {
    $this->setWidgets(array(
      'user_id'      => new sfWidgetFormDoctrineChoice(array('model' => $this->getRelatedModelName('sfGuardUser'), 'add_empty' => true)),
      'nickname'     => new sfWidgetFormFilterInput(),
      'first_name'   => new sfWidgetFormFilterInput(),
      'last_name'    => new sfWidgetFormFilterInput(),
      'birthday'     => new sfWidgetFormFilterDate(array('from_date' => new sfWidgetFormDate(), 'to_date' => new sfWidgetFormDate())),
      'facebook_uid' => new sfWidgetFormFilterInput(),
      'email'        => new sfWidgetFormFilterInput(),
      'email_hash'   => new sfWidgetFormFilterInput(),
      'teams_list'   => new sfWidgetFormDoctrineChoice(array('multiple' => true, 'model' => 'Team')),
    ));

    $this->setValidators(array(
      'user_id'      => new sfValidatorDoctrineChoice(array('required' => false, 'model' => $this->getRelatedModelName('sfGuardUser'), 'column' => 'id')),
      'nickname'     => new sfValidatorPass(array('required' => false)),
      'first_name'   => new sfValidatorPass(array('required' => false)),
      'last_name'    => new sfValidatorPass(array('required' => false)),
      'birthday'     => new sfValidatorDateRange(array('required' => false, 'from_date' => new sfValidatorDate(array('required' => false)), 'to_date' => new sfValidatorDateTime(array('required' => false)))),
      'facebook_uid' => new sfValidatorPass(array('required' => false)),
      'email'        => new sfValidatorPass(array('required' => false)),
      'email_hash'   => new sfValidatorPass(array('required' => false)),
      'teams_list'   => new sfValidatorDoctrineChoice(array('multiple' => true, 'model' => 'Team', 'required' => false)),
    ));

    $this->widgetSchema->setNameFormat('sf_guard_user_profile_filters[%s]');

    $this->errorSchema = new sfValidatorErrorSchema($this->validatorSchema);

    $this->setupInheritance();

    parent::setup();
  }

  public function addTeamsListColumnQuery(Doctrine_Query $query, $field, $values)
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
      ->leftJoin($query->getRootAlias().'.TeamPlayer TeamPlayer')
      ->andWhereIn('TeamPlayer.team_id', $values)
    ;
  }

  public function getModelName()
  {
    return 'sfGuardUserProfile';
  }

  public function getFields()
  {
    return array(
      'id'           => 'Number',
      'user_id'      => 'ForeignKey',
      'nickname'     => 'Text',
      'first_name'   => 'Text',
      'last_name'    => 'Text',
      'birthday'     => 'Date',
      'facebook_uid' => 'Text',
      'email'        => 'Text',
      'email_hash'   => 'Text',
      'teams_list'   => 'ManyKey',
    );
  }
}
