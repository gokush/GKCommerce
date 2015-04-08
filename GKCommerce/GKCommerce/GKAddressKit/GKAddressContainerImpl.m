//
//  GKAddressContainerImpl.m
//  GKAddressKitExample
//
//  Created by 小悟空 on 2/21/15.
//  Copyright (c) 2015 Goku. All rights reserved.
//

#import "GKAddressContainerImpl.h"
#import "GKRegionBackendImpl.h"
#import "GKAddressServiceImpl.h"
#import "GKAddressBackendImpl.h"
#import <GKAddressKitExample-swift.h>

@interface GKAddressContainerImpl()

@property (strong, nonatomic) PersistenStack *persistenStack;
@property (strong, nonatomic) NSURL *storeURL;
@property (strong, nonatomic) NSURL *modelURL;

@end

@implementation GKAddressContainerImpl

- (id<GKRegionBackend>)regionBackend
{
  return [[GKRegionBackendImpl alloc] init];
}

- (id<GKAddressService>)addressService
{
  return [[GKAddressServiceImpl alloc]
          initWithRegionBackend:[self regionBackend]];
}

- (id<GKAddressBackend>)addressBackend
{
  return [[GKAddressBackendImpl alloc] init];
}

- (id<GKAddressRepository>)addressRepository
{
    AddressRepository *addressRepository = [AddressRepository sharedInstance];
    addressRepository.managedObjectContext = self.persistenStack.managedObjectContext;
    return addressRepository;
}

- (PersistenStack *)persistenStack
{
    if (_persistenStack == nil) {
        _persistenStack = [[PersistenStack alloc] initWithStoreURL:self.storeURL modelURL:self.modelURL];
    }
    return _persistenStack;
}

- (NSURL *)storeURL
{
    NSURL *url = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
    return [url URLByAppendingPathComponent:@"addressmodel.sql"];
}

- (NSURL *)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"GKAddressModel" withExtension:@"momd"];
}

@end
