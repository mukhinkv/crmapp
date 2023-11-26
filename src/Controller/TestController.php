<?php

declare(strict_types=1);

namespace App\Controller;

use Doctrine\DBAL\Connection;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class TestController extends AbstractController
{
    #[Route('/test/db', name: 'test_db')]
    public function testDb(Connection $connection)
    {   $ab = "1313";
        $result = $connection->fetchAllAssociative('select version();');

        return $this->json(['status' => $result]);
    }
}