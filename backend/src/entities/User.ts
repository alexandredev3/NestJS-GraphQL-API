import { Exclude } from 'class-transformer';
import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  CreateDateColumn,
  UpdateDateColumn,
  OneToMany,
  JoinColumn,
} from 'typeorm';

import { Field, ObjectType } from '@nestjs/graphql';

import Post from './Post';

@ObjectType()
@Entity('users')
export default class User {
  @Field()
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Field()
  @Column('varchar')
  name: string;

  @Column('varchar', { unique: true })
  @Field()
  @Exclude()
  email: string;

  @Field()
  @Column({ type: 'varchar' })
  @Exclude()
  password: string;

  @OneToMany(() => Post, (post) => post.user, {
    cascade: ['insert', 'update'],
  })
  @JoinColumn({ name: 'author_id' })
  post: Post[];

  @Field()
  @CreateDateColumn()
  created_at: Date;

  @Field()
  @UpdateDateColumn()
  updated_at: Date;
}
