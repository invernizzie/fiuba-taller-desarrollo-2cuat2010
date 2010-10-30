<?php

/**
 * match actions.
 *
 * @package    tp-taller
 * @subpackage match
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class matchActions extends sfActions
{
  public function executeIndex(sfWebRequest $request)
  {
    $this->matchs = Doctrine_Core::getTable('Match')
      ->createQuery('a')
      ->execute();

    /*sfFacebook::requireLogin();
    //get the user object
    $user = $this->getUser();

    // facebook user id
    $this->fb_uid = $user->getCurrentFacebookUid();
    // get or create user based on fb_uid
    $fb_user = sfFacebook::getOrCreateUserByFacebookUid($this->fb_uid);*/
  }

  public function executeShow(sfWebRequest $request)
  {
    $this->match = Doctrine_Core::getTable('Match')->find(array($request->getParameter('id')));
    $this->forward404Unless($this->match);
  }

  public function executeNew(sfWebRequest $request)
  {
    $this->form = new MatchForm();
  }

  public function executeCreate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST));

    $this->form = new MatchForm();

    $this->processForm($request, $this->form);

    $this->setTemplate('new');
  }

  public function executeEdit(sfWebRequest $request)
  {
    $this->forward404Unless($match = Doctrine_Core::getTable('Match')->find(array($request->getParameter('id'))), sprintf('Object match does not exist (%s).', $request->getParameter('id')));
    $this->form = new MatchForm($match);
  }

  public function executeUpdate(sfWebRequest $request)
  {
    $this->forward404Unless($request->isMethod(sfRequest::POST) || $request->isMethod(sfRequest::PUT));
    $this->forward404Unless($match = Doctrine_Core::getTable('Match')->find(array($request->getParameter('id'))), sprintf('Object match does not exist (%s).', $request->getParameter('id')));
    $this->form = new MatchForm($match);

    $this->processForm($request, $this->form);

    $this->setTemplate('edit');
  }

  public function executeDelete(sfWebRequest $request)
  {
    $request->checkCSRFProtection();

    $this->forward404Unless($match = Doctrine_Core::getTable('Match')->find(array($request->getParameter('id'))), sprintf('Object match does not exist (%s).', $request->getParameter('id')));
    $match->delete();

    $this->redirect('match/index');
  }

  protected function processForm(sfWebRequest $request, sfForm $form)
  {
    $form->bind($request->getParameter($form->getName()), $request->getFiles($form->getName()));
    if ($form->isValid())
    {
      $match = $form->save();

      $this->redirect('match/edit?id='.$match->getId());
    }
  }
}
